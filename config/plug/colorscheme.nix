{ config, ... }:
let
  colors = import ../colors/${config.theme}.nix;
in
{
  plugins.transparent = {
  	enable = false;
    settings = {
      exclude_groups = [ ];
      groups = [
        "Normal"
        "NormalNC"
        "Comment"
        "Constant"
        "Special"
        "Identifier"
        "Statement"
        "PreProc"
        "Type"
        "Underlined"
        "Todo"
        "String"
        "Function"
        "Conditional"
        "Repeat"
        "Operator"
        "Structure"
        "LineNr"
        "NonText"
        "SignColumn"
        "CursorLine"
        "CursorLineNr"
        "StatusLine"
        "StatusLineNC"
        "EndOfBuffer"
        "BufferLine"
        "SignColumn"
        "Noice"
      ];
    };
  };
  colorschemes = {
    base16 = {
      enable = true;
      setUpBar = false;
      colorscheme = colors;
      settings = {
        cmp = true;
        illuminate = true;
        indentblankline = true;
        lsp_semantic = true;
        mini_completion = true;
        telescope = true;
        telescope_borders = false;
      };
    };
  };
}
