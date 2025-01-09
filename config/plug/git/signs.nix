{ config, lib, ... }:
{
  plugins.gitsigns = {
    enable = true;
    settings = {
      trouble = true;
      current_line_blame = true;
      current_line_blame_formatter = "   <author>, <committer_time:%R> • <summary>";
      signs = {
        add = {
          text = "│";
        };
        change = {
          text = "│";
        };
        delete = {
          text = "_";
        };
        topdelete = {
          text = "‾";
        };
        changedelete = {
          text = "~";
        };
        untracked = {
          text = "│";
        };
      };
    };
  };
}
