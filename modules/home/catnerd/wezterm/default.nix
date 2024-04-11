{ config
, lib
, ...
}:

let
  cfg = config.programs.wezterm.catnerd;
  enable = cfg.enable && config.programs.wezterm.enable;

  inherit (config.catnerd) flavour;
in
{
  options = {
    programs.wezterm.catnerd.enable = lib.mkOption {
      type = lib.types.bool;
      default = config.catnerd.enable;
      description = "Enable catnerd wezterm theme";
    };
  };

  config = lib.mkIf enable {
    programs.wezterm.extraConfig = ''
      return {
        color_scheme = "Catppuccin ${lib.catnerd.mkUpper flavour}",
      }
    '';
  };
}
