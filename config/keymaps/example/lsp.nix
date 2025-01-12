{ config, lib, ... }:
let
	none-ls = lib.optionals config.plugins.none-ls.enable [
		{
			mode = [ "n" "v" ];
			key = "<leader>cf";
			action = "<cmd>lua vim.lsp.buf.format()<cr>";
			options = { silent = true; desc = "Format"; };
		}
	];

  trouble = lib.optionals config.plugins.trouble.enable [
    {
      mode = "n";
      key = "<leader>xQ";
      action = "<CMD>Trouble qflist toggle<CR>";
      options = { desc = "Trouble quifick toggle"; };
    }
    {
      mode = "n";
      key = "<leader>xL";
      action = "<CMD>Trouble loclist toggle<CR>";
      options = { desc = "Trouble loclist toggle"; };
    }
    {
      mode = "n";
      key = "<leader>cs";
      action = "<CMD>Trouble symbols focus=false<CR>";
      options = { desc = "Trouble symbols toggle"; };
    }
    {
      mode = "n";
      key = "<leader>xx";
      action = "<CMD>Trouble diagnostics toggle<CR>";
      options = { desc = "Trouble diagnostics toggle"; };
    }
    {
      mode = "n";
      key = "[c";
      action = ":lua require('trouble').next {skip_groups = true, jump = true }<CR>";
      options = { desc = "Trouble next"; };
    }
    {
      mode = "n";
      key = "]c";
      action = ":lua require('trouble').prev {skip_groups = true, jump = true }<CR>";
      options = { desc = "Trouble prev"; };
    }
  ];

  lspsaga = lib.optionals config.plugins.lspsaga.enable [
    {
      mode = "n";
      key = "gd";
      action = "<cmd>Lspsaga finder def<CR>";
      options = { desc = "Goto Definition"; silent = false; };
    }
    {
      mode = "n";
      key = "gr";
      action = "<cmd>Lspsaga finder ref<CR>";
      options = { desc = "Goto References"; silent = false; };
    }
    {
      mode = "n";
      key = "gI";
      action = "<cmd>Lspsaga finder imp<CR>";
      options = { desc = "Goto Implementation"; silent = false; };
    }
    {
      mode = "n";
      key = "gT";
      action = "<cmd>Lspsaga peek_type_definition<CR>";
      options = { desc = "Type Definition"; silent = false; };
    }
    {
      mode = "n";
      key = "K";
      action = "<cmd>Lspsaga hover_doc<CR>";
      options = { desc = "Hover"; silent = true; };
    }
    {
      mode = "n";
      key = "<leader>cw";
      action = "<cmd>Lspsaga outline<CR>";
      options = { desc = "Outline"; silent = true; };
    }
    {
      mode = "n";
      key = "<leader>cr";
      action = "<cmd>Lspsaga rename<CR>";
      options = { desc = "Rename"; silent = true; };
    }
    {
      mode = "n";
      key = "<leader>ca";
      action = "<cmd>Lspsaga code_action<CR>";
      options = { desc = "Code Action"; silent = true; };
    }
    {
      mode = "n";
      key = "<leader>cd";
      action = "<cmd>Lspsaga show_line_diagnostics<CR>";
      options = { desc = "Line Diagnostics"; silent = true; };
    }
    {
      mode = "n";
      key = "[d";
      action = "<cmd>Lspsaga diagnostic_jump_next<CR>";
      options = { desc = "Next Diagnostic"; silent = true; };
    }
    {
      mode = "n";
      key = "]d";
      action = "<cmd>Lspsaga diagnostic_jump_prev<CR>";
      options = { desc = "Previous Diagnostic"; silent = true; };
    }
  ];
in
{
    keymaps = [] ++ none-ls ++ lspsaga ++ trouble;
}
