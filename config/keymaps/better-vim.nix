{
	keymaps = [
	{
	  mode = "v";
      key = "J";
      action = ":m '>+1<CR>gv=gv";
      options = { silent = false; desc = "Move selected lines down"; };
    }
	{
	  mode = "v";
      key = "K";
      action = ":m '<-2<CR>gv=gv";
      options = { silent = false; desc = "Move selected lines up"; };
    }
    {
	  mode = "n";
	  key = "<C-d>";
	  action = "<C-d>zz";
	  options = { silent = true; };
    }
    {
	  mode = "n";
	  key = "<C-u>";
	  action = "<C-u>zz";
	  options = { silent = true; };
    }
    {
	  mode = "n";
	  key = "n";
	  action = "nzzzv";
	  options = { silent = true; desc = "When searching to keep result in the midle"; };
    }
    {
	  mode = "n";
	  key = "N";
	  action = "Nzzzv";
	  options = { silent = true; desc = "When searching to keep result in the midle"; };
    }
    {
	  mode = "x";
	  key = "<leader>p";
	  action = ''\"_dP'';
	  options = { silent = false; desc = "Paste without overwrite buffer"; };
    }
    {
	  mode = [ "n" "v" ];
	  key = "<leader>y";
	  action = ''\"+y'';
	  options = { silent = false; desc = "Copy to system buffer"; };
    }
	{
	  mode = "v";
	  key = "<";
	  action = "<gv";
	  options = { silent = true; desc = "Stay in indent mode"; };
	}
	{
	  mode = "v";
	  key = ">";
	  action = ">gv";
	  options = { silent = true; desc = "Stay in indent mode"; };
	}
	{
	  mode = "n";
	  key = "<C-s>";
	  action = "<cmd> w <CR>";
	  options = { silent = true; desc = "Save file"; };
	}
	];
}
