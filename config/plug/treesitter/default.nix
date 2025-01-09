{
	imports = [
		./treesitter.nix
		./textobjects.nix
	];
	plugins.treesitter-context = {
		enable = false;
	};
}
