{ lib
, stdenv
, fetchFromGitHub

, flavour ? "macchiato"

, ...
}:

stdenv.mkDerivation rec {
  pname = "catppuccin-plymouth";
  version = "unstable-2024-04-05";

  src = fetchFromGitHub {
    owner = "catppuccin";
    repo = "plymouth";
    rev = "3be1603eacc988b0bdb99d9ef378b9b6a518c4f4";
    hash = "sha256-SWq+P2UET8xrxdO7+GSZC9NuHbtfHfoMQ0XTmji0NkE=";
  };

  sourceRoot = "${src.name}/themes/catppuccin-${flavour}";

  installPhase = ''
    sed -i 's:\(^ImageDir=\)/usr:\1'"$out"':' catppuccin-${flavour}.plymouth
    mkdir -p $out/share/plymouth/themes/catppuccin-${flavour}
    cp * $out/share/plymouth/themes/catppuccin-${flavour}
  '';

  meta = with lib; {
    description = "Soothing pastel theme for Plymouth";
    homepage = "https://github.com/catppuccin/plymouth";
    license = licenses.mit;
    # maintainers = with maintainers; [ ];
    mainProgram = "catppuccin-plymouth";
    platforms = platforms.all;
  };
}
