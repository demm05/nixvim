{ lib, config, ... }:
{
  keymaps = lib.mkIf config.plugins.notify.enable [
    {
      mode = "n";
      key = "<leader>un";
      action = ''
        <cmd>lua require("notify").dismiss({ silent = true, pending = true })<cr>
      '';
      options = {
        desc = "Dismiss All Notifications";
      };
    }
  ];
}
