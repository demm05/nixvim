{
  config,
  ...
}:
{
  imports = [
    ./clangd.nix
    ./lines.nix
  ];

  extraConfigLuaPre = ''
    require('lspconfig.ui.windows').default_options = {
      border = "rounded"
    }
  '';

  plugins.lsp = {
    enable = true;
    inlayHints = true;
    servers = {
      bashls.enable = true;
      biome.enable = true;
      cmake.enable = true;
      dockerls.enable = true;
      eslint.enable = true;
      gopls.enable = true;
      html.enable = true;
      jsonls.enable = true;
      lua_ls.enable = true;
      marksman.enable = true;
      pyright.enable = true;
      nixd.enable = true;
      statix.enable = true;
      taplo.enable = true;
      ts_ls.enable = !config.plugins.typescript-tools.enable;
      yamlls.enable = true;
      typos_lsp.enable = true;
    };
  };
}
