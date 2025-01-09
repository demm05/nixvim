{ lib, ... }:
{
  plugins.indent-blankline = {
    enable = lib.mkDefault true;
    settings = {
      indent.char = "▏";
      exclude = {
        buftypes = [
          "terminal"
          "quickfix"
        ];
        filetypes = [
          ""
          "checkhealth"
          "help"
          "lspinfo"
          "packer"
          "TelescopePrompt"
          "TelescopeResults"
          "yaml"
        ];
      };
      scope = {
        show_end = false;
        show_exact_scope = false;
        show_start = false;
      };
    };
  };
}
