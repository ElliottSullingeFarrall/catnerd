{ lib
, stdenv
, fetchFromGitHub

, flavour ? "macchiato"

, ...
}:

stdenv.mkDerivation rec {
  pname = "catppuccin-zsh-syntax-highlighting";
  version = "unstable-2022-10-13";

  src = fetchFromGitHub {
    owner = "catppuccin";
    repo = "zsh-syntax-highlighting";
    rev = "06d519c20798f0ebe275fc3a8101841faaeee8ea";
    hash = "sha256-Q7KmwUd9fblprL55W0Sf4g7lRcemnhjh4/v+TacJSfo=";
  };

  sourceRoot = "${src.name}/themes";

  installPhase = ''
    cp catppuccin_${flavour}-zsh-syntax-highlighting.zsh $out
  '';

  meta = with lib; {
    description = "Soothing pastel theme for zsh-syntax-highlighting";
    homepage = "https://github.com/catppuccin/zsh-syntax-highlighting";
    license = licenses.mit;
    # maintainers = with maintainers; [ ];
    mainProgram = "catppuccin-zsh-syntax-highlighting";
    platforms = platforms.all;
  };
}
