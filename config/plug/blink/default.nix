{
  config,
  lib,
  pkgs,
  ...
}:
{
  extraPlugins = with pkgs.vimPlugins; [
    blink-cmp-avante
    blink-cmp-conventional-commits
  ];

  plugins = lib.mkMerge [
    {
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
                        -- Check for both nil and the default fallback icon
                        if not kind_icon or kind_icon == '󰞋' then
                          -- Use our configured kind_icons
                          return require('blink.cmp.config').appearance.kind_icons[ctx.kind] or ""
                        end
                        return kind_icon
                      end,
                      -- Optionally, you may also use the highlights from mini.icons
                      highlight = function(ctx)
                        local _, hl, _ = require('mini.icons').get('lsp', ctx.kind)
                        return hl
                      end
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
          appearance = {
            use_nvim_cmp_as_default = true;
            kind_icons = {
              Copilot = "";
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
            default = [
              "buffer"
              "lsp"
              "path"
              "snippets"
              # Community
              "emoji"
              "spell"
              "ripgrep"
            ];
            providers = {
              lsp.score_offset = 4;
              conventional_commits =
                lib.mkIf (lib.elem pkgs.vimPlugins.blink-cmp-conventional-commits config.extraPlugins)
                  {
                    name = "Conventional Commits";
                    module = "blink-cmp-conventional-commits";
                    enabled.__raw = ''
                      function()
                        return vim.bo.filetype == 'gitcommit'
                      end
                    '';
                  };
              dictionary = lib.mkIf config.plugins.blink-cmp-dictionary.enable {
                name = "Dict";
                module = "blink-cmp-dictionary";
                min_keyword_length = 3;
              };
              emoji = lib.mkIf config.plugins.blink-emoji.enable {
                name = "Emoji";
                module = "blink-emoji";
                score_offset = 1;
              };
              ripgrep = lib.mkIf config.plugins.blink-ripgrep.enable {
                name = "Ripgrep";
                module = "blink-ripgrep";
                async = true;
                score_offset = 1;
              };
              spell = lib.mkIf config.plugins.blink-cmp-spell.enable {
                name = "Spell";
                module = "blink-cmp-spell";
                score_offset = 1;
              };
              easy-dotnet = lib.mkIf config.plugins.easy-dotnet.enable {
                module = "easy-dotnet.completion.blink";
                name = "easy-dotnet";
                async = true;
                score_offset = 1000;
                enabled.__raw = ''
                  function()
                    return vim.bo.filetype == "xml"
                  end
                '';
              };
            };
          };
        };
      };

      blink-cmp-spell.enable = true;
      blink-emoji.enable = true;
      blink-ripgrep.enable = true;
    }
  ];
}
