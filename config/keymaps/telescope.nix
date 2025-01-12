{ lib, config, ... }:
{
  keymaps = lib.mkIf config.plugins.telescope.enable [
    {
      mode = "n";
      key = "<leader>pF";
      action.__raw = ''
        function()
          require("telescope.builtin").find_files({ hidden = true, no_ignore = true})
        end
      '';
      options = { desc = "Find all files"; silent = true; };
    }
    {
      mode = "n";
      key = "<leader>p/";
      action.__raw = ''
        function()
          require("telescope.builtin").live_grep {
            additional_args = function(args) return vim.list_extend(args, { "--hidden", "--no-ignore" }) end,
          }
        end
      '';
      options = { desc = "Grep string in all files"; silent = true; };
    }
    {
      mode = "n";
      key = "<leader>b/";
      action.__raw = ''
        function()
          require("telescope.builtin").live_grep { grep_open_files=true }
        end
      '';
      options = { desc = "Find words in all open buffers"; silent = true; };
    }
  ];

  plugins.telescope.keymaps = {
  	"<leader>pf" = {
      action = "find_files";
      options.desc = "Find files";
  	};
  	"<leader>bs" = {
        action = "buffers";
        options.desc = "Buffer search";
  	};
    "<leader>f/" = {
      action = "current_buffer_fuzzy_find";
      options.desc = "Fuzzy find in current buffer";
    };
    "<leader>hc" = {
       action = "commands";
       options.desc = "View commands";
    };
  };
}
