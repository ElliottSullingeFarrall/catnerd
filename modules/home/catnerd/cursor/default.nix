{ config
, lib
, pkgs
, ...
}:

let
  cfg = config.home.cursor.catnerd;
  enable = cfg.enable;

  inherit (config.catnerd) flavour accent;
in
{
  options = {
    home.cursor.catnerd.enable = lib.mkOption {
      default = config.catnerd.enable;
      description = "Enable catnerd cursor theme";
      type = lib.types.bool;
    };
  };

  config = lib.mkIf enable {
    home.pointerCursor = {
      package = pkgs.catppuccin-cursors."${flavour}${lib.catnerd.mkUpper accent}";
      name = "catppuccin-${flavour}-${accent}-cursors";
      size = config.catnerd.cursor.size;
      gtk.enable = true;
    };
  };
}
