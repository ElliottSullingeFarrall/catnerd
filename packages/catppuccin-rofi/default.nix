{ lib
, stdenv
, fetchFromGitHub

, flavour ? "macchiato"
, accent ? "blue"

, ...
}:

stdenv.mkDerivation rec {
  pname = "catppuccin-rofi";
  version = "unstable-2022-12-31";

  src = fetchFromGitHub {
    owner = "catppuccin";
    repo = "rofi";
    rev = "5350da41a11814f950c3354f090b90d4674a95ce";
    hash = "sha256-DNorfyl3C4RBclF2KDgwvQQwixpTwSRu7fIvihPN8JY=";
  };

  sourceRoot = "${src.name}/basic/.local/share/rofi/themes";

  patches = [ ./vars.patch ./rounded.patch ];

  installPhase = ''
    substitute catppuccin-${flavour}.rasi $out \
      --subst-var-by accent '${builtins.toString lib.catnerd.colours.${flavour}.${accent}}' \
      --subst-var-by button '${builtins.toString lib.catnerd.colours.${flavour}.${accent}}'
  '';

  meta = with lib; {
    description = "Soothing pastel theme for Rofi";
    homepage = "https://github.com/catppuccin/rofi";
    license = licenses.mit;
    # maintainers = with maintainers; [ ];
    mainProgram = "catppuccin-rofi";
    platforms = platforms.all;
  };
}
