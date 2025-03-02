{ config, lib, ... }:
let
	none-ls = lib.optionals config.plugins.none-ls.enable [
		{
			mode = [ "n" "v" ];
			key = "<leader>ff";
			action = "<cmd>lua vim.lsp.buf.format()<cr>";
			options = { silent = true; desc = "Format File"; };
		}
	];

  trouble = lib.optionals config.plugins.trouble.enable [
    {
      mode = "n";
      key = "<leader>xx";
      action = "<CMD>Trouble diagnostics toggle<CR>";
      options = { desc = "Trouble diagnostics toggle"; };
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
      key = "gi";
      action = "<cmd>Lspsaga finder imp<CR>";
      options = { desc = "Goto Implementation"; silent = false; };
    }
    {
      mode = "n";
      key = "gt";
      action = "<cmd>Lspsaga peek_type_definition<CR>";
      options = { desc = "Type Definition"; silent = false; };
    }
    {
      mode = "n";
      key = "K";
      action = "<cmd>Lspsaga hover_doc<CR>";
      options = { desc = "Hover for doc"; silent = true; };
    }
    {
      mode = "n";
      key = "<leader>o";
      action = "<cmd>Lspsaga outline<CR>";
      options = { desc = "Outline"; silent = true; };
    }
    {
      mode = "n";
      key = "<leader>wr";
      action = "<cmd>Lspsaga rename<CR>";
      options = { desc = "Rename"; silent = true; };
    }
    {
      mode = "n";
      key = "<leader>ld";
      action = "<cmd>Lspsaga show_line_diagnostics<CR>";
      options = { desc = "Line Diagnostics"; silent = true; };
    }
  ];
in
{
    keymaps = [] ++ none-ls ++ lspsaga ++ trouble;
}
