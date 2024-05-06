{
  inputs = {
    nixpkgs.url = "github:NixOS/nixpkgs/nixos-unstable";
    flake-utils.url = "github:numtide/flake-utils";

  };

  outputs = { nixpkgs, flake-utils, ... }:
    let pkgs = import nixpkgs { system = "x86_64-linux";
                                config.allowUnfree = true;
                                overlays = [];
                              };
    in {

      devShell.x86_64-linux = nixpkgs.legacyPackages.x86_64-linux.mkShell {
        nativeBuildInputs = with pkgs.buildPackages; [
          hugo
          emacs29-nox
        ];
      };
    };
}
