{ config
, lib
, pkgs
, ...
}:

let
  cfg = config.programs.zsh.syntaxHighlighting.catnerd;
  enable = cfg.enable && config.programs.zsh.enable && (config.programs.zsh.syntaxHighlighting.package == pkgs.zsh-syntax-highlighting);

  inherit (config.catnerd) flavour;
in
{
  options = {
    programs.zsh.syntaxHighlighting.catnerd.enable = lib.mkOption {
      type = lib.types.bool;
      default = config.catnerd.enable;
      description = "Enable catnerd zsh-syntax-highlighting theme";
    };
  };

  config = lib.mkIf enable {
    programs.zsh.initExtra = ''
      source ${pkgs.catnerd.catppuccin-zsh-syntax-highlighting.override { inherit flavour; }}
    '';
  };
}
