{ lib, config, ... }:
{
  keymaps = lib.mkIf config.plugins.bufferline.enable [
    {
      mode = "n";
      key = "<Tab>";
      action = "<cmd>BufferLineCycleNext<cr>";
      options = {
        desc = "Cycle to next buffer";
      };
    }

    {
      mode = "n";
      key = "<S-Tab>";
      action = "<cmd>BufferLineCyclePrev<cr>";
      options = {
        desc = "Cycle to previous buffer";
      };
    }

    {
      mode = "n";
      key = "<S-l>";
      action = "<cmd>BufferLineCycleNext<cr>";
      options = {
        desc = "Cycle to next buffer";
      };
    }

    {
      mode = "n";
      key = "<S-h>";
      action = "<cmd>BufferLineCyclePrev<cr>";
      options = {
        desc = "Cycle to previous buffer";
      };
    }

    {
      mode = "n";
      key = "<leader>bd";
      action = "<cmd>bdelete<cr>";
      options = {
        desc = "[b]uffer [d]elete";
      };
    }

    {
      mode = "n";
      key = "<leader>br";
      action = "<cmd>BufferLineCloseRight<cr>";
      options = {
        desc = "Delete [b]uffers to the [r]ight";
      };
    }

    {
      mode = "n";
      key = "<leader>bl";
      action = "<cmd>BufferLineCloseLeft<cr>";
      options = {
        desc = "Delete [b]uffers to the [l]eft";
      };
    }

    {
      mode = "n";
      key = "<leader>bo";
      action = "<cmd>BufferLineCloseOthers<cr>";
      options = {
        desc = "Delete other buffers";
      };
    }

    {
      mode = "n";
      key = "<leader>bp";
      action = "<cmd>BufferLineTogglePin<cr>";
      options = {
        desc = "Toggle pin";
      };
    }

    {
      mode = "n";
      key = "<leader>bP";
      action = "<Cmd>BufferLineGroupClose ungrouped<CR>";
      options = {
        desc = "Delete non-pinned buffers";
      };
    }
  ];
}
