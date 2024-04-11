{ ...
}:

{

  /* -------------------------------------------------------------------------- */
  /*                                   modules                                  */
  /* -------------------------------------------------------------------------- */

  # font
  # ...
  # grub
  boot.loader.grub.enable = true;
  # plymouth
  boot.plymouth.enable = true;
  # tty
  # ...

  /* -------------------------------------------------------------------------- */
  /*                                    misc                                    */
  /* -------------------------------------------------------------------------- */

  # Needed for GTK theming
  programs.dconf.enable = true;

}