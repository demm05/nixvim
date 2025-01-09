{ config, lib, ... }:
{
  plugins.gitblame = {
    enable = false;
    settings = {
      date_format = "%r";
      delay = 200;
      display_virtual_text = true;
      highlight_group = "Comment";
      message_template = "<summary> • <date> • <author>";
      message_when_not_committed = "Oh please, commit this !";
      set_extmark_options = {
        priority = 7;
      };
      use_blame_commit_file_urls = false;
      virtual_text_column = 80;
    };
  };
}
