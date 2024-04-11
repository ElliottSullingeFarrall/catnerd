{ lib
, stdenv
, fetchurl

, flavour ? "macchiato"

, ...
}:

stdenv.mkDerivation rec {
  pname = "catppuccin-swaync";
  version = "0.2.1";

  src = fetchurl {
    url = "https://github.com/catppuccin/swaync/releases/download/v${version}/${flavour}.css";
    sha256 = "sha256-7SB3T94fe8bZtpi3z5VRFAplmcoP734ZitWv4vtylVQ=";
  };

  dontUnpack = true;

  installPhase = ''
    cp $src $out
  '';

  meta = with lib; {
    description = "Soothing pastel theme for SwayNC";
    homepage = "https://github.com/catppuccin/swaync";
    license = licenses.mit;
    # maintainers = with maintainers; [ ];
    mainProgram = "catppuccin-swaync";
    platforms = platforms.all;
  };
}
