{
  plugins.guess-indent = {
    enable = true;
    settings = {
      auto_cmd = false;
      filetype_exclude = [
        "markdown"
      ];
      buftype_exclude = [
        "help"
        "nofile"
        "terminal"
        "prompt"
      ];
      override_editorconfig = true;
      on_space_options = {
        expandtab = true;
        shiftwidth = "detected";
        softtabstop = "detected";
        tabstop = "detected";
      };
    };
  };
}
