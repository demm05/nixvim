{ config, lib, ... }:
{
  keymaps = lib.mkIf config.plugins.mini.enable [
    {
      mode = "n";
      key = "<leader>e";
      action = "<cmd>lua require('mini.files').open()<CR>";
      options = {
        desc = "Mini Files";
      };
    }
  ];
  plugins.mini.modules.files = {
    mappings = {
      synchronize = "s";
    };
  };
}
