{
	imports = [
		./cmp.nix
		./blink.nix
		./blink-compat.nix
		./avante.nix
	];

	plugins.schemastore = {
		enable = true;
		yaml.enable = true;
		json.enable = false;
	};
}
