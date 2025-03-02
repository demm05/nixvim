{
	description = "Dmytro's NeoVim configuration";

	inputs = {
		nixpkgs.url = "github:nixos/nixpkgs?ref=nixos-unstable";
		flake-parts.url = "github:hercules-ci/flake-parts";
		nixvim = {
			url = "github:nix-community/nixvim";
			inputs.nixpkgs.follows = "nixpkgs";
		};
		pre-commit-hooks = {
			url = "github:cachix/pre-commit-hooks.nix";
			inputs.nixpkgs.follows = "nixpkgs";
		};
		blink-cmp = {
			url = "github:saghen/blink.cmp";
		};
	};
	outputs = { nixvim, flake-parts, pre-commit-hooks, ... }@inputs:
	flake-parts.lib.mkFlake { inherit inputs; } {
		systems = [
			"aarch64-linux"
			"x86_64-linux"
			"aarch64-darwin"
			"x86_64-darwin"
		];
		perSystem = { system, pkgs, self', ... }:
		let
			nixvim' = nixvim.legacyPackages.${system};
			nvim = nixvim'.makeNixvimWithModule {
				inherit pkgs;
				module = ./config;
				extraSpecialArgs = {
					inherit inputs system;
				};
			};
		in
		{
			checks = {
				pre-commit-hooks = pre-commit-hooks.lib.${system}.run {
					src = ./.;
					hooks = {
						statix.enable = true;
						nixfmt-rfc-style.enable = true;
						deadnix = {
							enable = true;
							settings = {
								edit = true;
							};
						};
					};
				};
			};
			formatter = pkgs.nixfmt-rfc-style;
			packages.default = nvim;
			devShells = {
				default = with pkgs; mkShell {inherit (self'.checks.pre-commit-check) shellHoook; };
			};
		};
	};
}
