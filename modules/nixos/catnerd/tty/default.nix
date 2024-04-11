{ config
, lib
, pkgs
, ...
}:

let
  cfg = config.tty.catnerd;
  enable = cfg.enable;

  inherit (config.catnerd) flavour accent;

  splitAndFilter = str: lib.filter (s: s != "") (lib.splitString "\n" str);
in
{
  options = {
    tty.catnerd = {
      enable = lib.mkOption {
        default = config.catnerd.enable;
        description = "Enable catnerd tty theme";
        type = lib.types.bool;
      };
    };
  };

  config = lib.mkIf enable {
    boot.kernelParams = (splitAndFilter (builtins.readFile "${pkgs.catnerd.catppuccin-tty.override { inherit flavour accent; }}"));
  };
}
