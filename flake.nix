{
  inputs = {
    nixpkgs.url = "github:NixOS/nixpkgs/nixos-unstable";
    flake-utils.url = "github:numtide/flake-utils";
  };

  outputs =
    {
      self,
      nixpkgs,
      flake-utils,
      ...
    }:
    flake-utils.lib.eachDefaultSystem (
      system:
      let
        pkgs = import nixpkgs { inherit system; };
      in
      {
        devShells = {
          python313 = pkgs.mkShell {
            buildInputs = with pkgs; [
              python313
              python313Packages.pip
            ];
          };

          uv = pkgs.mkShell {
            buildInputs = with pkgs; [ uv ];
          };

        };
      }
    );
}
