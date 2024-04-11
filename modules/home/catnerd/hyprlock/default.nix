{ config
, lib
, pkgs
, ...
}:

let
  cfg = config.programs.hyprlock.catnerd;
  enable = cfg.enable && config.programs.hyprlock.enable;

  inherit (config.catnerd) flavour accent fonts;
in
{
  options = {
    programs.hyprlock.catnerd.enable = lib.mkOption {
      type = lib.types.bool;
      default = config.catnerd.enable;
      description = "Enable catnerd hyprlock theme";
    };
  };

  config = lib.mkIf enable {
    # Theme
    xdg.configFile."hypr/hyprlock.conf".source = "${pkgs.catnerd.catppuccin-hyprlock.override { inherit flavour accent; font = fonts.main.family; }}";
    # Background
    xdg.configFile."background".source = pkgs.catnerd.catppuccin-splash.override { inherit flavour accent; };
  };
}
