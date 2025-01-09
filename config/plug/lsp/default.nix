{
  imports = [
    ./conform.nix
    ./none-ls.nix
    ./trouble.nix
    ./lspsaga.nix
  ];
  plugins = {
    lsp-format.enable = true;
    lsp = {
      # https://nix-community.github.io/nixvim/plugins/lsp/index.html
      enable = true;
      servers = {
        ccls.enable = true;
        nil_ls.enable = true;
        yamlls.enable = true;
        markdown_oxide.enable = true;
        lua_ls.enable = true;
        nixd.enable = true;
        html.enable = true;
        clangd.enable = true;
      };
    };
  };
}
