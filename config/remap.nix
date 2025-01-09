{
	globals.mapleader = " ";

	keymaps = [
		{
			mode = [ "n" "v" ];
			key = "<leader>y";
			action = ''"+y'';
			options = { desc = "Copy to global buffer"; };
		}
		{
			mode = [ "n" "v" ];
			key = "<leader>p";
			action = ''"+p'';
			options = { desc = "Paste to global buffer"; };
		}
		{
			mode = "v";
			key = "<";
			action = "<gv";
			options = { desc = "Stay in indent mode"; };
		}
		{
			mode = "v";
			key = ">";
			action = ">gv";
			options = { desc = "Stay in indent mode"; };
		}
	];
}
