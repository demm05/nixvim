{ pkgs, ... }:
{
	opts = {
		number = true;
		relativenumber = true;

		guicursor = "";
		expandtab = false;
		copyindent = true;
		preserveindent = true;
		softtabstop = 0;
		shiftwidth = 4;
		tabstop = 4;
		
		hlsearch = false;
		incsearch = true;
		
		scrolloff = 10;
		signcolumn = "yes";
		
		updatetime = 50;
		
		foldcolumn = "0";
		foldlevel = 99;
		foldlevelstart = 99;
		foldenable = true;
		
		showmode = false;
	};

	performance = {
		byteCompileLua = {
			enable = true;
			nvimRuntime = true;
			configs = true;
			plugins = true;
		};
	};
	clipboard = {
		register = "unnamedplus";

		providers = {
			wl-copy = {
				enable = true;
				package = pkgs.wl-clipboard;
			};
		};
	};
	diagnostics = {
		update_in_insert = true;
		severity_sort = true;
		float = {
			border = "rounded";
		};
		jump = {
			severity.__raw = "vim.diagnostic.severity.WARN";
		};
	};
}
