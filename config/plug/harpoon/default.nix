{ config, lib, ... }:
{
  plugins = {
    harpoon = {
      enable = true;
    };

    which-key.settings.spec = lib.optionals config.plugins.harpoon.enable [
      {
        __unkeyed-1 = "<leader>h";
        group = "Harpoon";
        icon = "󱡀 ";
      }
    ];
  };

  keymaps = lib.mkIf config.plugins.harpoon.enable [
    {
      mode = "n";
      key = "<leader>ha";
      options.desc = "Add file";
      action.__raw = "function() require'harpoon':list():add() end";
    }
    {
      mode = "n";
      key = "<leader>h";
      options.desc = "Quick Menu";
      action.__raw = "function() require'harpoon'.ui:toggle_quick_menu(require'harpoon':list()) end";
    }
    {
      mode = "n";
      key = "<leader>h1";
      options.desc = "1";
      action.__raw = "function() require'harpoon':list():select(1) end";
    }
    {
      mode = "n";
      key = "<leader>h2";
      options.desc = "2";
      action.__raw = "function() require'harpoon':list():select(2) end";
    }
    {
      mode = "n";
      key = "<leader>h3";
      options.desc = "3";
      action.__raw = "function() require'harpoon':list():select(3) end";
    }
    {
      mode = "n";
      key = "<leader>h4";
      options.desc = "4";
      action.__raw = "function() require'harpoon':list():select(4) end";
    }
  ];
}
