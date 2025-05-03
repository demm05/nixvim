{ lib, config, ... }:
let
  generateTransparentPrefixClearerLua = prefixesList: ''
    local transparent_ok, transparent = pcall(require, 'transparent')
    if not transparent_ok then
      vim.notify("transparent.nvim not found, skipping prefix clearing", vim.log.levels.WARN)
      return
    end
    local prefixes_to_clear_lua_table = {
      ${lib.concatMapStringsSep "\n      " (prefix: ''"${prefix}",'') prefixesList}
    }
    for _, prefix in ipairs(prefixes_to_clear_lua_table) do
      -- Use pcall for safety in case the clear_prefix function errors
      local clear_ok, clear_result = pcall(transparent.clear_prefix, prefix)
      if not clear_ok then
          vim.notify("Error clearing transparent prefix: " .. prefix .. " - " .. tostring(clear_result), vim.log.levels.ERROR)
      end
    end
  '';
  transparentPrefixesToClear = [
    "Mini"
    "WhichKey"
    "BufferLine"
    "Treesitter"
    "Blink"
  ];
in
{
  plugins.transparent = {
    enable = true;
    settings = {
      extra_groups = [
        "NormalFloat"
        "FloatBorder"
      ];
    };
  };
  extraConfigLuaPost = lib.mkIf config.plugins.transparent.enable (
    lib.mkOrder 5000 (generateTransparentPrefixClearerLua transparentPrefixesToClear)
  );
}
