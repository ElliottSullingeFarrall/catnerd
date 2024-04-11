{ config
, lib
, pkgs
, ...
}:

let
  cfg = config.programs.waybar.catnerd;
  enable = cfg.enable && config.programs.waybar.enable;

  inherit (config.catnerd) flavour accent;
in
{
  options = {
    programs.waybar.catnerd.enable = lib.mkOption {
      type = lib.types.bool;
      default = config.catnerd.enable;
      description = "Enable catnerd waybar theme";
    };
  };

  config = lib.mkIf enable {
    programs.waybar.style = ''
      @import "${pkgs.catnerd.catppuccin-waybar.override { inherit flavour accent; }}";
    '';
  };
}
