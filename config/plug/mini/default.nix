{ lib, config, ... }:
{
  imports = [
    ./files.nix
    ./comment.nix
    ./git.nix
    ./hipatterns.nix
    ./pairs.nix
    ./surround.nix
    ./map.nix
  ];

  plugins.mini = {
    enable = true;
    mockDevIcons = true;

    modules = {
      align = { };
      move = { };
      cursorword = { };
      statusline = { };
      icons = { };
      fuzzy = { };
      snippets = {
        snippets = {
          __unkeyed-1.__raw =
            lib.mkIf config.plugins.friendly-snippets.enable # Lua
              "require('mini.snippets').gen_loader.from_file('${config.plugins.friendly-snippets.package}/snippets/global.json')";
          __unkeyed-2.__raw = "require('mini.snippets').gen_loader.from_lang()";
        };
      };

    };
  };
}
