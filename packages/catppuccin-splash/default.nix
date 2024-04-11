{ lib
, stdenv
, imagemagick

, flavour ? "macchiato"

, ...
}:

stdenv.mkDerivation {
  pname = "catppuccin-splash";
  version = "1.0.0";

  dontUnpack = true;

  buildInputs = [ imagemagick ];

  installPhase = ''
    convert -size 1000x1000 xc:'${builtins.toString lib.catnerd.colours.${flavour}.base}' PNG:$out
  '';
}
