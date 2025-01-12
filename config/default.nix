{ config, lib, ... }:
{
	imports = [
		./sets.nix
		./plug
		./highligh.nix
		./keymaps
		./plug/utils/42-school.nix
	];
	options = {
		theme = lib.mkOption {
			default = lib.mkDefault "paradise";
			type = lib.types.enum [
				"aquarium"
				"decay"
				"edge-dark"
				"everblush"
				"everforest"
				"far"
				"gruvbox"
				"jellybeans"
				"material"
				"material-darker"
				"mountain"
				"ocean"
				"oxocarbon"
				"paradise"
				"tokyonight"
				"yoru"
				"cyberdream"
			];
		};
	};
	config = {
		# The base16 theme to use, if you want to use another theme, change it in colorscheme.nix
		theme = "paradise";
		extraConfigLua = ''
		_G.theme = "${config.theme}"
		'';
	};
}
