{ config
, lib
, pkgs
, ...
}:

let
  cfg = config.wayland.windowManager.hyprland.catnerd;
  enable = cfg.enable && config.wayland.windowManager.hyprland.enable;

  inherit (config.catnerd) flavour accent;
in
{
  options = {
    wayland.windowManager.hyprland.catnerd = {
      enable = lib.mkOption {
        default = config.catnerd.enable;
        description = "Enable catnerd hyprland theme";
        type = lib.types.bool;
      };
    };
  };

  config = lib.mkIf enable {
    wayland.windowManager.hyprland.settings = {
      source = [
        "${pkgs.catnerd.catppuccin-hyprland.override { inherit flavour accent; }}"
      ];
      settings = {
        env = [
          "QT_STYLE_OVERRIDE, gtk2"

          "XCURSOR_SIZE, ${builtins.toString config.catnerd.cursor.size}"
        ];
      };
      misc.background_color = "rgb(${lib.catnerd.mkColour lib.catnerd.colours.${flavour}.base})";
    };
  };
}
