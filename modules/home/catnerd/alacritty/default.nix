{ config
, lib
, pkgs
, ...
}:

let
  cfg = config.programs.alacritty.catnerd;
  enable = cfg.enable && config.programs.alacritty.enable;

  inherit (config.catnerd) flavour;
in
{
  options = {
    programs.alacritty.catnerd.enable = lib.mkOption {
      type = lib.types.bool;
      default = config.catnerd.enable;
      description = "Enable catnerd alacritty theme";
    };
  };

  config = lib.mkIf enable {
    programs.alacritty.settings = builtins.fromTOML (builtins.readFile (pkgs.catnerd.catppuccin-alacritty.override { inherit flavour; }));
  };
}
