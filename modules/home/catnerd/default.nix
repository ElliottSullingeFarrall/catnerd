{ osConfig
, ...
}:

{
  imports = [
    ../../catnerd.nix

    ./alacritty
    ./cursor
    ./foot
    ./gtk
    ./hyprland
    ./hyprlock
    ./kitty
    ./qt
    ./rofi
    ./starship
    ./swaync
    ./waybar
    ./wezterm
    ./xresources
    ./zsh-syntax-highlighting
  ];

  config.assertions = [
    {
      assertion = osConfig.programs.dconf.enable;
      message = "CatNerd requires dconf to be enabled in NixOS";
    }
  ];
}
