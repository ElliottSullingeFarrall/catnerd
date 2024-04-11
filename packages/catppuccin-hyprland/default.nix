{ lib
, stdenv
, fetchFromGitHub

, flavour ? "macchiato"

, ...
}:

stdenv.mkDerivation rec {
  pname = "catppuccin-hyprland";
  version = "1.3";

  src = fetchFromGitHub {
    owner = "catppuccin";
    repo = "hyprland";
    rev = "v${version}";
    hash = "sha256-jkk021LLjCLpWOaInzO4Klg6UOR4Sh5IcKdUxIn7Dis=";
  };

  sourceRoot = "${src.name}/themes";

  installPhase = ''
    cp ${flavour}.conf $out
  '';

  meta = with lib; {
    description = "Soothing pastel theme for Hyprland";
    homepage = "https://github.com/catppuccin/hyprland";
    license = licenses.mit;
    # maintainers = with maintainers; [ ];
    mainProgram = "catppuccin-hyprland";
    platforms = platforms.all;
  };
}
