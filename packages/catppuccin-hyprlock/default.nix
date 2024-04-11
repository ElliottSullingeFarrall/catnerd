{ namespace
, lib
, pkgs
, stdenv
, fetchFromGitHub

, flavour ? "macchiato"
, accent ? "blue"
, font ? "Ubuntu"
}:

stdenv.mkDerivation {
  pname = "catppuccin-hyprlock";
  version = "unstable-2024-04-01";

  src = fetchFromGitHub {
    owner = "catppuccin";
    repo = "hyprlock";
    rev = "d5a6767000409334be8413f19bfd1cf5b6bb5cc6";
    hash = "sha256-pjMFPaonq3h3e9fvifCneZ8oxxb1sufFQd7hsFe6/i4=";
  };

  patches = [ ./vars.patch ];

  installPhase = ''
    substitute hyprlock.conf $out \
      --subst-var-by palette '${pkgs.${namespace}.catppuccin-hyprland.override { inherit flavour; }}' \
      --subst-var-by accent '${accent}' \
      --subst-var-by font '${font} Nerd Font'
  '';

  meta = with lib; {
    description = "Soothing pastel theme for Hyprlock";
    homepage = "https://github.com/catppuccin/hyprlock";
    license = licenses.mit;
    # maintainers = with maintainers; [ ];
    mainProgram = "catppuccin-hyprlock";
    platforms = platforms.all;
  };
}
