{
  inputs = {
    python_313.url = "./python_313";
    uv.url = "./uv";
  };

  outputs =
    { python_313, uv, ... }:
    {
      python_313 = python_313.outputs;
      uv = uv.outputs;
    };
}
