{ config, lib, ... }:
let
  cfg = config.plugins.hardtime;
in
{
  globals.disable_hardtime = true;

  plugins = {
    hardtime = {
      enable = true;

      lazyLoad.settings.cmd = "Hardtime";

      settings = {
        enabled = false;
        disable_mouse = false;
      };
    };
  };

  keymaps = lib.mkIf cfg.enable [
    {
      mode = "n";
      key = "<leader>tH";
      action.__raw = ''
        function ()
          vim.g.disable_hardtime = not vim.g.disable_hardtime
          if vim.g.disable_hardtime then
            vim.cmd("Hardtime disable")
          else
            vim.cmd("Hardtime enable")
          end
          vim.notify(string.format("Hardtime %s", bool2str(not vim.g.disable_hardtime), "info"))
        end
      '';
      options = {
        desc = "Hardtime toggle";
        silent = true;
      };
    }
  ];
}
