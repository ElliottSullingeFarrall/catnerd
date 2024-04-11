{ config
, lib
, pkgs
, ...
}:

let
  cfg = config.programs.starship.catnerd;
  enable = cfg.enable && config.programs.starship.enable;

  inherit (config.catnerd) flavour;
in
{
  options = {
    programs.starship.catnerd.enable = lib.mkOption {
      type = lib.types.bool;
      default = config.catnerd.enable;
      description = "Enable catnerd starship theme";
    };
  };

  config = lib.mkIf enable {
    programs.starship.settings = builtins.fromTOML (builtins.readFile (pkgs.catnerd.catppuccin-starship.override { inherit flavour; })) // {
      palette = "catppuccin_${flavour}";
    };
  };
}
