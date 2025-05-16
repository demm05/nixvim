{ lib, config, ... }:
{
  globals = {
    mapleader = " ";
  };
  keymaps = [
    {
      mode = "n"; # back and fourth between the two most recent files
      key = "<C-b>";
      action = "<cmd>b#<CR>";
    }
    {
      mode = "n";
      key = "<Space>";
      action = "<NOP>";
    }
    {
      mode = "n"; # Esc to clear search results
      key = "<esc>";
      action = "<cmd>noh<CR>";
    }
    {
      mode = "n"; # Backspace delete in normal
      key = "<BS>";
      action = "<BS>x";
    }
    {
      mode = "n";
      key = "Y";
      action = "y$";
    }
    {
      mode = "n";
      key = "<C-s>";
      action = "<Esc><cmd>w<CR>";
    }
    {
      mode = "n";
      key = "j";
      action = "v:count == 0 ? 'gj' : 'j'";
      options = {
        desc = "Move cursor down";
        expr = true;
      };
    }
    {
      mode = "n";
      key = "k";
      action = "v:count == 0 ? 'gk' : 'k'";
      options = {
        desc = "Move cursor up";
        expr = true;
      };
    }
    {
      mode = "n";
      key = "<leader>q";
      action = "<Cmd>confirm q<CR>";
      options = {
        desc = "Quit";
      };
    }
    {
      mode = "n";
      key = "<C-n>";
      action = "<Cmd>enew<CR>";
      options = {
        desc = "New file";
      };
    }
    {
      mode = "n";
      key = "|";
      action = "<Cmd>vsplit<CR>";
      options = {
        desc = "Vertical split";
      };
    }
    {
      mode = "n";
      key = "-";
      action = "<Cmd>split<CR>";
      options = {
        desc = "Horizontal split";
      };
    }
    {
      mode = "n";
      key = "<TAB>";
      action = "<cmd>bnext<CR>";
      options = {
        desc = "Next buffer (default)";
      };
    }
    {
      mode = "n";
      key = "<S-TAB>";
      action = "<cmd>bprevious<CR>";
      options = {
        desc = "Previous buffer";
      };
    }
    {
      mode = "n";
      key = "<leader>lr";
      action.__raw = ''
        function ()
          vim.lsp.buf.rename()
        end
      '';
      options = {
        desc = "Word Replace";
      };
    }
    {
      mode = "n";
      key = "<leader>ti";
      action.__raw = ''
        function ()
          vim.lsp.inlay_hint.enable(not vim.lsp.inlay_hint.is_enabled({0}), {0})
        end'';
      options = {
        desc = "Inlay lsp hints";
      };
    }
    {
      mode = "n";
      key = "<leader>td";
      action.__raw = ''
        function ()
          vim.b.disable_diagnostics = not vim.b.disable_diagnostics
          if vim.b.disable_diagnostics then
            vim.diagnostic.disable(0)
          else
            vim.diagnostic.enable(0)
          end
          vim.notify(string.format("Buffer Diagnostics %s", bool2str(not vim.b.disable_diagnostics), "info"))
        end'';
      options = {
        desc = "Buffer Diagnostics toggle";
      };
    }
    {
      mode = "n";
      key = "<leader>tD";
      action.__raw = ''
        function ()
          vim.g.disable_diagnostics = not vim.g.disable_diagnostics
          if vim.g.disable_diagnostics then
            vim.diagnostic.disable()
          else
            vim.diagnostic.enable()
          end
          vim.notify(string.format("Global Diagnostics %s", bool2str(not vim.g.disable_diagnostics), "info"))
        end'';
      options = {
        desc = "Global Diagnostics toggle";
      };
    }
    {
      mode = "n";
      key = "<leader>tf";
      action.__raw = ''
        function ()
          vim.cmd('FormatToggle!')
          vim.notify(string.format("Buffer Autoformatting %s", bool2str(not vim.b[0].disable_autoformat), "info"))
        end'';
      options = {
        desc = "Buffer Autoformatting toggle";
      };
    }
    {
      mode = "n";
      key = "<leader>tF";
      action.__raw = ''
        function ()
          vim.cmd('FormatToggle')
          vim.notify(string.format("Global Autoformatting %s", bool2str(not vim.g.disable_autoformat), "info"))
        end'';
      options = {
        desc = "Global Autoformatting toggle";
      };
    }
    {
      mode = "n";
      key = "<leader>tS";
      action.__raw = ''
        function ()
          if vim.g.spell_enabled then vim.cmd('setlocal nospell') end
          if not vim.g.spell_enabled then vim.cmd('setlocal spell') end
          vim.g.spell_enabled = not vim.g.spell_enabled
          vim.notify(string.format("Spell %s", bool2str(vim.g.spell_enabled), "info"))
        end'';
      options = {
        desc = "Spell toggle";
      };
    }
    {
      mode = "n";
      key = "<leader>tw";
      action.__raw = ''
        function ()
          vim.wo.wrap = not vim.wo.wrap
          vim.notify(string.format("Wrap %s", bool2str(vim.wo.wrap), "info"))
        end'';
      options = {
        desc = "Word Wrap toggle";
      };
    }
    {
      mode = "x";
      key = "<leader>p";
      action = ''\"_dP'';
      options = {
        silent = false;
        desc = "Paste without overwrite buffer";
      };
    }
    {
      mode = "v";
      key = "<";
      action = "<gv";
      options = {
        desc = "Unindent line";
      };
    }
    {
      mode = "v";
      key = "<S-Tab>";
      action = "<gv";
      options = {
        desc = "Unindent line";
      };
    }
    {
      mode = "v";
      key = ">";
      action = ">gv";
      options = {
        desc = "Indent line";
      };
    }
    {
      mode = "v";
      key = "<Tab>";
      action = ">gv";
      options = {
        desc = "Indent line";
      };
    }
    {
      mode = "v";
      key = "<BS>";
      action = "x";
    }
    {
      mode = "i";
      key = "<M-k>";
      action = "<C-o>gk";
      options = { };
    }
    {
      mode = "i";
      key = "<M-h>";
      action = "<Left>";
      options = { };
    }
    {
      mode = "i";
      key = "<M-l>";
      action = "<Right>";
      options = { };
    }
    {
      mode = "i";
      key = "<M-j>";
      action = "<C-o>gj";
      options = { };
    }
    {
      mode = "i";
      key = "<C-v>";
      action = "<Esc><C-v>";
      options = { };
    }
    {
      mode = "n";
      key = "N";
      action = "Nzzzv";
      options = {
        silent = true;
        desc = "When searching to keep result in the midle";
      };
    }
    {
      mode = "x";
      key = "<leader>p";
      action = ''\"_dP'';
      options = {
        silent = false;
        desc = "Paste without overwrite buffer";
      };
    }
  ];
}
