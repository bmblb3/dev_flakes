{
  inputs = {
    nixpkgs.url = "github:NixOS/nixpkgs/nixos-25.05";
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
          python311 = pkgs.mkShell {
            buildInputs = with pkgs; [
              python311
              python311Packages.pip
            ];
          };

          python312 = pkgs.mkShell {
            buildInputs = with pkgs; [
              python312
              python312Packages.pip
            ];
          };

          python313 = pkgs.mkShell {
            buildInputs = with pkgs; [
              python313
              python313Packages.pip
            ];
          };

          uv = pkgs.mkShell {
            buildInputs = with pkgs; [ uv ];
          };

          rust = pkgs.mkShell {
            buildInputs = with pkgs; [
              cargo
              cargo-release
              cargo-semver-checks
              clippy
              gcc
              release-plz
              rustc
              rustfmt
            ];
          };

        };
      }
    );
}
