{ config
, lib
, pkgs
, ...
}:

let
  cfg = config.services.swaync.catnerd;
  enable = cfg.enable && config.services.swaync.enable;

  inherit (config.catnerd) flavour accent;
in
{
  options = {
    services.swaync.catnerd.enable = lib.mkOption {
      type = lib.types.bool;
      default = config.catnerd.enable;
      description = "Enable catnerd swaync theme";
    };
  };

  config = lib.mkIf enable {
    services.swaync.style = pkgs.catnerd.catppuccin-swaync.override { inherit flavour accent; };
  };
}
