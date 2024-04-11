{ lib
, system
, ...
}:

lib.pre-commit-hooks.${system}.run {
  src = ./.;

  hooks = {
    editorconfig-checker = {
      enable = true;
      types_or = [ "nix" "shell" ];
    };

    nil.enable = true;
    nixpkgs-fmt.enable = true;
    deadnix.enable = true;
  };
}
