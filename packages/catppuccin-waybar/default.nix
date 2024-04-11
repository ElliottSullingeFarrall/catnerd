{ lib
, stdenv
, fetchFromGitHub

, flavour ? "macchiato"

, ...
}:

stdenv.mkDerivation rec {
  pname = "catppuccin-waybar";
  version = "1.1";

  src = fetchFromGitHub {
    owner = "catppuccin";
    repo = "waybar";
    rev = "v${version}";
    hash = "sha256-9lY+v1CTbpw2lREG/h65mLLw5KuT8OJdEPOb+NNC6Fo=";
  };

  sourceRoot = "${src.name}/themes";

  installPhase = ''
    cp ${flavour}.css $out
  '';

  meta = with lib; {
    description = "Soothing pastel theme for Waybar";
    homepage = "https://github.com/catppuccin/waybar";
    license = licenses.mit;
    # maintainers = with maintainers; [ ];
    mainProgram = "catppuccin-waybar";
    platforms = platforms.all;
  };
}
