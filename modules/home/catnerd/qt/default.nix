{ config
, lib
, pkgs
, ...
}:

let
  cfg = config.qt.catnerd;
  enable = cfg.enable && config.qt.enable;

  inherit (config.catnerd) flavour accent;
in
{
  options = {
    qt.catnerd.enable = lib.mkOption {
      type = lib.types.bool;
      default = config.catnerd.enable;
      description = "Enable catnerd Qt theme";
    };
  };

  config = lib.mkIf enable {
    qt = {
      platformTheme.name = "gtk";
      style = {
        name = "Catppuccin-${lib.catnerd.mkUpper flavour}-Compact-${lib.catnerd.mkUpper accent}-Dark";
        package = pkgs.catppuccin-gtk.override {
          variant = flavour;
          accents = [ accent ];
          size = "compact";
          tweaks = [ "rimless" ];
        };
      };
    };
  };
}
