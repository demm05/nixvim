{
  lib,
  config,
  ...
}:
{
  imports = [
    #./git.nix
    #./lsp.nix
  ];

  plugins = {
    fzf-lua = {
      enable = true;
      profile = "telescope";

      lazyLoad.settings.cmd = [
        "FzfLua"
      ] ++ lib.optionals config.plugins.noice.enable [ "Noice fzf" ];

      settings = {
        oldfiles = {
          cwd_only = true;
        };
        winopts = {
          preview = {
            default = "bat";
          };
        };
      };
    };
  };
}
