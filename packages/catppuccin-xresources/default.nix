{ lib
, stdenv
, fetchFromGitHub

, flavour ? "macchiato"

, ...
}:

stdenv.mkDerivation {
  pname = "catppuccin-xresources";
  version = "unstable-2022-10-12";

  src = fetchFromGitHub {
    owner = "catppuccin";
    repo = "xresources";
    rev = "d82c02323e05158ad35f302771e3695affafab78";
    hash = "sha256-irRQPjvcTH6AUC07Sm2l77CkrZQNHNJXxBDBSIhl1Fg=";
  };

  installPhase = ''
    cp ${flavour}.Xresources $out
  '';

  meta = with lib; {
    description = "Soothing pastel theme for Xresources";
    homepage = "https://github.com/catppuccin/xresources";
    license = licenses.mit;
    # maintainers = with maintainers; [ ];
    mainProgram = "xresources";
    platforms = platforms.all;
  };
}
