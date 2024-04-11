{ lib
, stdenv
, fetchFromGitHub

, flavour ? "macchiato"

, ...
}:

stdenv.mkDerivation rec {
  pname = "catppuccin-tty";
  version = "unstable-2023-06-27";

  src = fetchFromGitHub {
    owner = "catppuccin";
    repo = "tty";
    rev = "d18074fc5ee69c281b0269eb138b6ad53509eab7";
    hash = "sha256-LeGX6HtcnMLFyDkkm4fgTEbVgzyfYZXEX3GSpSvbFwo=";
  };

  sourceRoot = "${src.name}";

  installPhase = ''
    params=$(bash generate.sh ${flavour})
    for colour in $params; do
      echo $colour >> $out
    done
  '';

  meta = with lib; {
    description = "Soothing pastel theme for the Linux TTY";
    homepage = "https://github.com/catppuccin/tty";
    license = licenses.mit;
    # maintainers = with maintainers; [ ];
    mainProgram = "catppuccin-tty";
    platforms = platforms.all;
  };
}
