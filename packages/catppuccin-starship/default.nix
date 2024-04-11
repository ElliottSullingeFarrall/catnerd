{ lib
, stdenv
, fetchFromGitHub

, flavour ? "macchiato"

, ...
}:

stdenv.mkDerivation rec {
  pname = "catppuccin-starship";
  version = "unstable-2024-05-24";

  src = fetchFromGitHub {
    owner = "catppuccin";
    repo = "starship";
    rev = "ca2fb0600730fd3958a2cb4d4ca97c401877b365";
    hash = "sha256-KzXO4dqpufxTew064ZLp3zKIXBwbF8Bi+I0Xa63j/lI=";
  };

  sourceRoot = "${src.name}/palettes";

  installPhase = ''
    cp ${flavour}.toml $out
  '';

  meta = with lib; {
    description = "Soothing pastel theme for Starship";
    homepage = "https://github.com/catppuccin/starship";
    license = licenses.mit;
    # maintainers = with maintainers; [ ];
    mainProgram = "starship";
    platforms = platforms.all;
  };
}
