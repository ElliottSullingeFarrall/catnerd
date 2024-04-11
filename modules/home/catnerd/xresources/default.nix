{ osConfig
, config
, lib
, pkgs
, ...
}:

let
  cfg = config.xresources.catnerd;
  enable = cfg.enable && osConfig.services.xserver.enable;

  inherit (config.catnerd) flavour accent;
in
{
  options = {
    xresources.catnerd.enable = lib.mkOption {
      type = lib.types.bool;
      default = config.catnerd.enable;
      description = "Enable catnerd xresources theme";
    };
  };

  config = lib.mkIf enable {
    xresources.extraConfig = "${pkgs.catnerd.catppuccin-xresources.override { inherit flavour accent; }}";
  };
}
