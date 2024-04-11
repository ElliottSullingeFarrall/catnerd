{ lib
, stdenv
, fetchFromGitHub

, flavour ? "macchiato"

, ...
}:

stdenv.mkDerivation rec {
  pname = "catppuccin-foot";
  version = "unstable-2024-06-06";

  src = fetchFromGitHub {
    owner = "catppuccin";
    repo = "foot";
    rev = "80756a4d63ea4fae4d0fdd793017370f8b8b12ac";
    hash = "sha256-h6+7ln/i+FRSfWX2aSLhrxFO4mYJgH2pzzhe2Zz9Q4k=";
  };

  sourceRoot = "${src.name}/themes";

  installPhase = ''
    cp catppuccin-${flavour}.ini $out
  '';

  meta = with lib; {
    description = "Soothing pastel theme for Foot";
    homepage = "https://github.com/catppuccin/foot";
    license = licenses.mit;
    # maintainers = with maintainers; [ ];
    mainProgram = "catppuccin-foot";
    platforms = platforms.all;
  };
}
