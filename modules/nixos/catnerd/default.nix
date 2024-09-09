{ config
, ...
}:

{
  imports = [
    ../../catnerd.nix

    ./font
    ./grub
    ./plymouth
    ./tty
  ];

  config.assertions = [
    {
      assertion = config.programs.dconf.enable;
      message = "CatNerd requires dconf to be enabled in NixOS";
    }
  ];
}
