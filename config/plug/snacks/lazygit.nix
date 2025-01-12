{ pkgs, ... }:
{
  extraPackages = with pkgs; [ lazygit ];

  plugins.snacks = {
    settings = {
      lazygit.enabled = true;
    };
  };
}
