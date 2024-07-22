{ lib
, stdenv
, fetchFromGitHub

, flavour ? "macchiato"

, ...
}:

stdenv.mkDerivation rec {
  pname = "catppuccin-alacritty";
  version = "main";

  src = fetchFromGitHub {
    owner = "catppuccin";
    repo = "alacritty";
    rev = version;
    hash = "sha256-5MUWHXs8vfl2/u6YXB4krT5aLutVssPBr+DiuOdMAto=";
  };

  installPhase = ''
    cp catppuccin-${flavour}.toml $out
  '';

  meta = with lib; {
    description = "Soothing pastel theme for Alacritty";
    homepage = "https://github.com/catppuccin/alacritty";
    license = licenses.mit;
    # maintainers = with maintainers; [ ];
    mainProgram = "alacritty";
    platforms = platforms.all;
  };
}
