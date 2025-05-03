{
  plugins.lsp.servers.clangd = {
    enable = true;
    extraOptions = {
      init_options = {
        usePlaceholders = true;
        completeUnimported = true;
        clangdFileStatus = true;
      };
    };
    cmd = [
      "clangd"
      "--background-index"
      "--clang-tidy"
      "--header-insertion=iwyu"
      "--completion-style=detailed"
      "--function-arg-placeholders"
    ];
  };
}
