{ lib, config, ... }:
{
  keymaps = lib.mkIf config.plugins.cmp.enable [
    {
      mode = [
        "i"
        "s"
      ];
      key = "<C-k>";
      action.__raw = ''
        function()
         local ls = require "luasnip" 
         if ls.expand_or_jumpable() then
           ls.expand_or_jump()
         end
        end
      '';
    }
    {
      mode = [
        "i"
        "s"
      ];
      key = "<C-j>";
      action.__raw = ''
        function()
         local ls = require "luasnip" 
         if ls.jumpable(-1) then
           ls.jump(-1)
         end
        end
      '';
    }
  ];
  plugins.cmp.settings.mapping = {
  "<C-d>" = # Lua
    "cmp.mapping.scroll_docs(-4)";
  "<C-f>" = # Lua
    "cmp.mapping.scroll_docs(4)";
  "<C-Space>" = # Lua
    "cmp.mapping.complete()";
  "<C-e>" = # Lua
    "cmp.mapping.close()";
  "<Tab>" = # Lua
    "cmp.mapping(cmp.mapping.select_next_item({behavior = cmp.SelectBehavior.Select}), {'i', 's'})";
  "<S-Tab>" = # Lua
    "cmp.mapping(cmp.mapping.select_prev_item({behavior = cmp.SelectBehavior.Select}), {'i', 's'})";
  "<CR>" = # Lua
    "cmp.mapping.confirm({ select = false, behavior = cmp.ConfirmBehavior.Replace })";
  };
}
