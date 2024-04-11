{ config
, lib
, pkgs
, ...
}:

let
  cfg = config.programs.foot.catnerd;
  enable = cfg.enable && config.programs.foot.enable;

  inherit (config.catnerd) flavour;
in
{
  options = {
    programs.foot.catnerd.enable = lib.mkOption {
      type = lib.types.bool;
      default = config.catnerd.enable;
      description = "Enable catnerd foot theme";
    };
  };

  config = lib.mkIf enable {
    xdg.configFile."foot/foot.ini".source = (pkgs.catnerd.catppuccin-foot.override { inherit flavour; });
  };
}
