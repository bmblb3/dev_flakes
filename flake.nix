{
  outputs =
    { self }:
    {
      python_313 = import ./python_313/flake.nix;
      uv = import ./uv/flake.nix;
    };
}
