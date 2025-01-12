{
	keymaps = [
		{
			mode = "n";
			key = "<C-h>";
			action = ":lua require('smart-splits').move_cursor_left()<CR>";
			options = { silent = true; desc = "Move cursor to the left window"; };
		}
		{
			mode = "n";
			key = "<C-j>";
			action = ":lua require('smart-splits').move_cursor_down()<CR>";
			options = { silent = true; desc = "Move cursor to the window below"; };
		}
		{
			mode = "n";
			key = "<C-k>";
			action = ":lua require('smart-splits').move_cursor_up()<CR>";
			options = { silent = true; desc = "Move cursor to the window above"; };
		}
		{
			mode = "n";
			key = "<C-l>";
			action = ":lua require('smart-splits').move_cursor_right()<CR>";
			options = { silent = true; desc = "Move cursor to the right window"; };
		}
		{
			mode = "n";
			key = "<A-h>";
			action = ":lua require('smart-splits').resize_left()<CR>";
			options = { silent = true; desc = "Resize window to the left"; };
		}
		{
			mode = "n";
			key = "<A-j>";
			action = ":lua require('smart-splits').resize_down()<CR>";
			options = { silent = true; desc = "Resize window downwards"; };
		}
		{
			mode = "n";
			key = "<A-k>";
			action = ":lua require('smart-splits').resize_up()<CR>";
			options = { silent = true; desc = "Resize window upwards"; };
		}
		{
			mode = "n";
			key = "<A-l>";
			action = ":lua require('smart-splits').resize_right()<CR>";
			options = { silent = true; desc = "Resize window to the right"; };
		}
	];
}
