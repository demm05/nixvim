{
  config,
  lib,
  pkgs,
  ...
}:
{
  clipboard = {
    register = "unnamedplus";

    providers = {
      wl-copy = lib.mkIf pkgs.stdenv.hostPlatform.isLinux {
        enable = true;
        package = pkgs.wl-clipboard;
      };
    };
  };

  luaLoader.enable = true;
  globals = {
    # Disable useless providers
    loaded_ruby_provider = 0; # Ruby
    loaded_perl_provider = 0; # Perl
    loaded_python_provider = 0; # Python 2

    # Custom for toggles
    disable_diagnostics = false;
    disable_autoformat = false;
    spell_enabled = true;
    colorizing_enabled = false;
    first_buffer_opened = false;
    whitespace_character_enabled = false;

  };

  opts = {
    completeopt = lib.mkIf (!config.plugins.blink-cmp.enable) [
      "fuzzy"
      "menuone"
      "noselect"
      "popup"
    ];

    updatetime = 100; # Faster completion

    showtabline = 0;
    # Line numbers
    relativenumber = true; # Relative line numbers
    number = true; # Display the absolute line number of the current line
    hidden = true; # Keep closed buffer open in the background
    mouse = "a"; # Enable mouse control
    mousemodel = "extend"; # Mouse right-click extends the current selection
    splitbelow = true; # A new window is put below the current one
    splitright = true; # A new window is put right of the current one

    swapfile = false; # Disable the swap file
    modeline = true; # Tags such as 'vim:ft=sh'
    modelines = 100; # Sets the type of modelines
    undofile = true; # Automatically save and restore undo history
    incsearch = true; # Incremental search: show match for partly typed search command
    ignorecase = true; # When the search query is lower-case, match both lower and upper-case
    #   patterns
    smartcase = true; # Override the 'ignorecase' option if the search pattern contains upper
    #   case characters
    cursorline = true; # Highlight the screen line of the cursor
    cursorcolumn = false; # Highlight the screen column of the cursor
    signcolumn = "yes"; # Whether to show the signcolumn
    colorcolumn = "100"; # Columns to highlight
    laststatus = 3; # When to use a status line for the last window
    fileencoding = "utf-8"; # File-content encoding for the current buffer
    termguicolors = true; # Enables 24-bit RGB color in the |TUI|
    spelllang = lib.mkDefault [ "en_us" ]; # Spell check languages
    spell = true; # Highlight spelling mistakes (local to window)
    wrap = false; # Prevent text from wrapping

    # Tab options
    guicursor = "";
    expandtab = false;
    copyindent = true;
    preserveindent = true;
    softtabstop = 0;
    shiftwidth = 4;
    tabstop = 4;
    autoindent = true; # Do clever autoindenting

    textwidth = 0; # Maximum width of text that is being inserted.  A longer line will be
    #   broken after white space to get this width.

    # Folding
    foldlevel = 99; # Folds with a level higher than this number will be closed
    foldcolumn = "1";
    foldenable = true;
    foldlevelstart = -1;
    fillchars = {
      horiz = "━";
      horizup = "┻";
      horizdown = "┳";
      vert = "┃";
      vertleft = "┫";
      vertright = "┣";
      verthoriz = "╋";

      eob = " ";
      diff = "╱";

      fold = " ";
      foldopen = "";
      foldclose = "";

      msgsep = "‾";
    };

    # backspace = { append = [ "nostop" ]; };
    breakindent = true;
    cmdheight = 0;
    # diffopt = { append = [ "algorithm:histogram" "linematch:60" ]; };
    # fillchars = { eob = " "; };
    history = 100;
    infercase = true;
    linebreak = true;
    pumheight = 10;
    # shortmess = { append = { s = true; I = true; }; };
    showmode = false;
    timeoutlen = 500;
    title = true;
    # viewoptions = { remove = [ "curdir" ]; };
    virtualedit = "block";
    writebackup = false;

    lazyredraw = false; # Faster scrolling if enabled, breaks noice
    synmaxcol = 240; # Max column for syntax highlight
    showmatch = true; # when closing a bracket, briefly flash the matching one
    matchtime = 1; # duration of that flashing n deci-seconds
    startofline = true; # motions like "G" also move to the first char
    report = 9001; # disable "x more/fewer lines" messages

    # FIXME: double floating windows?
    # winborder = "rounded"; # Border style for floating windows
  };
}
