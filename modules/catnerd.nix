{ config
, lib
, ...
}:

let
  cfg = config.catnerd;
  inherit (cfg) enable;
in
{
  options.catnerd = {
    enable = lib.mkEnableOption "Enable CatNerd theming";

    flavour = lib.mkOption {
      type = lib.types.enum lib.catnerd.flavours;
      default = "macchiato";
      description = "Catppuccin flavour";
    };

    accent = lib.mkOption {
      type = lib.types.enum lib.catnerd.accents;
      default = "blue";
      description = "Catppuccin accent";
    };

    cursor = {
      size = lib.mkOption {
        type = lib.types.int;
        default = 24;
        description = "Cursor size";
      };
    };

    fonts = {
      main = {
        family = lib.mkOption {
          type = lib.types.enum lib.catnerd.mainFonts;
          default = "Ubuntu";
          description = "Main nerdfont family";
        };
        size = lib.mkOption {
          type = lib.types.int;
          default = 10;
          description = "Main nerdfont size";
        };
      };
      mono = {
        family = lib.mkOption {
          type = lib.types.enum lib.catnerd.monoFonts;
          default = "DroidSansM";
          description = "Mono nerdfont family";
        };
        size = lib.mkOption {
          type = lib.types.int;
          default = 12;
          description = "Mono nerdfont size";
        };
      };
    };
  };

  config = lib.mkIf enable {
    assertions = [
      {
        assertion = config.programs.dconf.enable;
        message = "CatNerd requires dconf to be enabled";
      }
    ];
  };
}
