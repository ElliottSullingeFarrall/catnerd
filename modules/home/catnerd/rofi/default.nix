{ config
, lib
, pkgs
, ...
}:

let
  cfg = config.programs.rofi.catnerd;
  enable = cfg.enable && config.programs.rofi.enable;

  inherit (config.catnerd) flavour accent;
in
{
  options = {
    programs.rofi.catnerd.enable = lib.mkOption {
      type = lib.types.bool;
      default = config.catnerd.enable;
      description = "Enable catnerd rofi theme";
    };
  };

  config = lib.mkIf enable {
    programs.rofi = {
      theme = "${pkgs.catnerd.catppuccin-rofi.override { inherit flavour accent; }}";
      font = "${config.catnerd.fonts.main.family} Nerd Font ${builtins.toString config.catnerd.fonts.main.size}";
    };
  };
}
