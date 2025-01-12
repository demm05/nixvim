{ config, lib, ... }:
let
  colors = import ../../colors/${config.theme}.nix { };
in
{
  plugins = {
    bufferline = {
      enable = true;
      settings = {
        options = {
          separator_style = "thin"; # “slant”, “padded_slant”, “slope”, “padded_slope”, “thick”, “thin”
        };
        highlights = lib.mkIf config.colorschemes.base16.enable {
          fill = {
            fg = "none";
            bg = "none";
          };
          background = {
            fg = "none";
            bg = "none";
          };
          buffer = {
            fg = "none";
            bg = "none";
          };
          buffer_selected = {
            fg = colors.base05;
            bg = colors.base01;
            italic = false;
          };
          buffer_visible = {
            fg = colors.base05;
            bg = "none";
          };
          close_button = {
            fg = "none";
            bg = "none";
          };
          close_button_visible = {
            fg = colors.base03;
            bg = "none";
          };
          close_button_selected = {
            fg = colors.base08;
            bg = colors.base01;
          };
          indicator_selected = {
            fg = colors.base0E;
            bg = colors.base01;
          };
          indicator_visible = {
            fg = colors.base0E;
            bg = "none";
          };
          separator = {
            fg = colors.base00;
            bg = colors.base00;
          };
          separator_selected = {
            fg = colors.base00;
            bg = colors.base00;
          };
          separator_visible = {
            fg = colors.base00;
            bg = colors.base00;
          };
          modified = {
            fg = colors.base03;
            bg = colors.base00;
          };
          modified_visible = {
            fg = colors.base00;
            bg = colors.base00;
          };
          modified_selected = {
            fg = colors.base0B;
            bg = colors.base01;
          };
          tab_close = {
            fg = colors.base00;
            bg = colors.base00;
          };
          duplicate = {
            bg = "none";
            italic = false;
          };
          duplicate_visible = {
            bg = "none";
            italic = false;
          };
          duplicate_selected = {
            fg = "none";
            bg = colors.base01;
            italic = false;
          };
        };
      };
    };
  };
}
