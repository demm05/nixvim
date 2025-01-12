{ config, lib, ... }:
let
  colors = import ../../colors/${config.theme}.nix { };
in
{
  plugins.mini.modules.files = {
    content = {
      filter.__raw = ''
        function(entry)
          return entry.name ~= '.git' and entry.name ~= '.direnv' and entry.name ~= '.envrc' and entry.name ~= '.gitlab' and entry.name ~= '.github'
        end'';
    };
    windows = {
      preview = true;
      width_preview = 100;
    };
    mappings = {
      synchronize = "s";
    };
  };
  highlight =
    lib.mkIf (config.plugins.mini.enable && lib.hasAttr "files" config.plugins.mini.modules)
      {
        MiniFilesNormal = with colors; {
          bg = base01;
        };
        MiniFilesBorder = with colors; {
          bg = base01;
          fg = base01;
        };

      };

}
