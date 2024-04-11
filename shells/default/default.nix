{ mkShell
, inputs
, system
, pkgs
, ...
}:

mkShell {
  inherit (inputs.self.checks.${system}.pre-commit) shellHook;
  buildInputs = inputs.self.checks.${system}.pre-commit.enabledPackages;

  packages = with pkgs; [
    snowfallorg.flake
    nix-init
  ];

  EDITOR = "code -w";
}
