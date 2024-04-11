{ config
, lib
, pkgs
, ...
}:

let
  cfg = config.fonts.catnerd;
  enable = cfg.enable;
in
{
  options = {
    fonts.catnerd = {
      enable = lib.mkOption {
        default = config.catnerd.enable;
        description = "Enable catnerd fonts";
        type = lib.types.bool;
      };
    };
  };

  config = lib.mkIf enable {
    fonts = {
      fontconfig.enable = true;
      packages = with pkgs; [ nerdfonts ];
    };
  };
}
