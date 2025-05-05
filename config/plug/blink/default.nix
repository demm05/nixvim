{
  config,
  lib,
  pkgs,
  ...
}:
{
  extraPlugins = with pkgs.vimPlugins; [
    blink-ripgrep-nvim
  ];

  plugins = {
    blink-cmp-spell.enable = true;
    blink-emoji.enable = true;
    blink-ripgrep.enable = true;

    blink-cmp = {
      enable = true;

      lazyLoad.settings.event = [
        "InsertEnter"
        "CmdlineEnter"
      ];

      settings = {
        cmdline = {
          completion = {
            list.selection = {
              preselect = false;
            };
            menu.auto_show = true;
          };
          keymap = {
            preset = "enter";
            "<CR>" = [
              "accept_and_enter"
              "fallback"
            ];
          };
        };
        completion = {
          ghost_text.enabled = true;
          documentation = {
            auto_show = true;
            window.border = "rounded";
          };
          list.selection = {
            auto_insert = false;
            preselect = false;
          };
          menu = {
            border = "rounded";
            draw = {
              columns = [
                {
                  __unkeyed-1 = "label";
                }
                {
                  __unkeyed-1 = "kind_icon";
                  __unkeyed-2 = "kind";
                  gap = 1;
                }
                { __unkeyed-1 = "source_name"; }
              ];
              components = {
                kind_icon = {
                  ellipsis = false;
                  text.__raw = ''
                    function(ctx)
                      local kind_icon, _, _ = require('mini.icons').get('lsp', ctx.kind)
                      if not kind_icon or kind_icon == '󰞋' then
                        return require('blink.cmp.config').appearance.kind_icons[ctx.kind] or ""
                      end
                      return kind_icon
                    end,
                  '';
                };
              };
            };
          };
        };
        fuzzy = {
          implementation = "rust";
          prebuilt_binaries = {
            download = false;
          };
        };
        keymap = {
          preset = "enter";
        };
        signature = {
          enabled = true;
          window.border = "rounded";
        };
        snippets.preset = "mini_snippets";
        sources = {
          default =
            [
              "buffer"
              "lsp"
              "path"
              "snippets"
            ]
            ++ lib.optional (config.plugins.blink-cmp-dictionary.enable or false) "dictionary"
            ++ lib.optional (config.plugins.blink-emoji.enable or false) "emoji"
            ++ lib.optional (config.plugins.blink-ripgrep.enable or false) "ripgrep"
            ++ lib.optional (config.plugins.blink-cmp-spell.enable or false) "spell";
          providers = {
            lsp.score_offset = 100;
            buffer.score_offset = 80;
            ripgrep = lib.mkIf config.plugins.blink-ripgrep.enable {
              name = "Ripgrep";
              module = "blink-ripgrep";
              async = true;
              score_offset = 90;
            };
            dictionary = lib.mkIf config.plugins.blink-cmp-dictionary.enable {
              name = "Dict";
              module = "blink-cmp-dictionary";
              min_keyword_length = 3;
            };
            emoji = lib.mkIf config.plugins.blink-emoji.enable {
              name = "Emoji";
              module = "blink-emoji";
            };
            spell = lib.mkIf config.plugins.blink-cmp-spell.enable {
              name = "Spell";
              module = "blink-cmp-spell";
            };
          };
        };
      };
    };
  };
  extraConfigLuaPost = lib.optionalString config.plugins.blink-ripgrep.enable ''
    if vim.fn.executable('rg') == 0 then
      vim.notify(
        'Warning: ripgrep (rg) command not found in PATH.\
        Features requiring it (like blink-ripgrep source) may not work correctly.\
        Please ensure pkgs.ripgrep is included in your Nix environment (e.g., home.packages).',
        vim.log.levels.WARN,
        { title = 'Nixvim Runtime Check' }
      )
    end
  '';
}
