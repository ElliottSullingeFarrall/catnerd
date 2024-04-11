{ lib
, stdenv
, fetchFromGitHub

, flavour ? "macchiato"

, ...
}:

stdenv.mkDerivation rec {
  pname = "catppuccin-grub";
  version = "1.0.0";

  src = fetchFromGitHub {
    owner = "catppuccin";
    repo = "grub";
    rev = "v${version}";
    hash = "sha256-/bSolCta8GCZ4lP0u5NVqYQ9Y3ZooYCNdTwORNvR7M0=";
  };

  sourceRoot = "${src.name}/src";

  installPhase = ''
    cp -r catppuccin-${flavour}-grub-theme $out
  '';

  meta = with lib; {
    description = "Soothing pastel theme for Grub2 & Ventoy";
    homepage = "https://github.com/catppuccin/grub";
    license = licenses.mit;
    # maintainers = with maintainers; [ ];
    mainProgram = "cappuccin-grub";
    platforms = platforms.all;
  };
}
