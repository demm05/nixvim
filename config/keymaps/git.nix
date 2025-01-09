{ config, lib, ... }:
let
	gitblame = lib.optionals config.plugins.gitblame.enable [
    	{
			mode = [ "n" "v" ];
			key = "<leader>gb";
			action = "gitblame";
			options = { silent = true; desc = "+blame"; };
		}
		{
			mode = "n";
			key = "<leader>gbt";
			action = ":GitBlameToggle<CR>";
			options = { silent = true; desc = "Toggle"; };
		}
		{
			mode = "n";
			key = "<leader>gbs";
			action = ":GitBlameCopySHA<CR>";
			options = { silent = true; desc = "Copy SHA"; };
		}
		{
			mode = "n";
			key = "<leader>gbc";
			action = ":GitBlameCopyFileURL<CR>";
			options = { silent = true; desc = "Copy URL"; };
		}
		{
			mode = "n";
			key = "<leader>gbo";
			action = ":GitBlameOpenFileURL<CR>";
			options = { silent = true; desc = "Open file URL"; };
		}
	];
	gitsigns = lib.optionals config.plugins.gitsigns.enable [
		{
			mode = [ "n" "v" ];
			key = "<leader>gh";
			action = "gitsigns";
			options = { silent = true; desc = "+hunks"; };
		}
		{
			mode = "n";
			key = "<leader>ghb";
			action = ":Gitsigns blame_line<CR>";
			options = { silent = true; desc = "Blame line"; };
		}
		{
			mode = "n";
			key = "<leader>ghd";
			action = ":Gitsigns diffthis<CR>";
			options = { silent = true; desc = "Diff This"; }; }
		{
			mode = "n";
			key = "<leader>ghR";
			action = ":Gitsigns reset_buffer<CR>";
			options = { silent = true; desc = "Reset Buffer"; };
		}
		{
			mode = "n";
			key = "<leader>ghS";
			action = ":Gitsigns stage_buffer<CR>";
			options = { silent = true; desc = "Stage Buffer"; };
		}
	];
in
{
	keymaps = [] ++ gitblame ++ gitsigns;
}
