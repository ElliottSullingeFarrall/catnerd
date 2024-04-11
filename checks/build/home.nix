{ pkgs
, ...
}:

{

  /* -------------------------------------------------------------------------- */
  /*                                   modules                                  */
  /* -------------------------------------------------------------------------- */

  # alacritty
  programs.alacritty.enable = true;
  # cursor
  # ...
  # foot
  programs.foot.enable = true;
  # gtk
  gtk.enable = true;
  # hyprland
  wayland.windowManager.hyprland = {
    enable = true;
    # settings.source = [];
  };
  # hyprlock
  programs.hyprlock.enable = true;
  # kitty
  programs.kitty.enable = true;
  # qt
  qt.enable = true;
  # rofi
  programs.rofi.enable = true;
  # starship
  programs.starship.enable = true;
  # swaync
  services.swaync.enable = true;
  # waybar
  programs.waybar.enable = true;
  # wezterm
  programs.wezterm.enable = true;
  # xresources
  # ...
  # zsh-syntax-highlighting
  programs.zsh.enable = true;
  programs.zsh.syntaxHighlighting.package = pkgs.zsh-syntax-highlighting;

}
