{
  keymaps = [
    {
      mode = [ "n" ];
      key = "<leader>e";
      action = "<cmd>Neotree toggle<cr>";
      options = {
        desc = "Open/Close Neotree";
      };
    }
    {
      mode = [ "n" ];
      key = "<leader>w";
      action = "<cmd>Neotree toggle float<cr>";
      options = {
        desc = "Neotree toggle float";
      };
    }
  ];
}
