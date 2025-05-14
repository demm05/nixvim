{
  self,
  system,
  ...
}:
{
  imports = [
    ./indent.nix
    ./bigfile.nix
    ./picker.nix
    ./bufdelete.nix
  ];

  plugins = {
    snacks = {
      enable = true;
      package = self.packages.${system}.snacks-nvim;
    };
  };
}
