{
  plugins.lsp-lines = {
    enable = true;
  };

  diagnostics = {
    virtual_lines = false;
    virtual_text = false;
  };

  keymaps = [
    {
      mode = "n";
      key = "<leader>tl";
      action.__raw = "require('lsp_lines').toggle";
      options = {
        desc = "Toggle LSP Virtual Lines";
      };
    }
  ];
}
