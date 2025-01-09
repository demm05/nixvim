{ pkgs, ... }:
{
  extraPlugins = with pkgs.vimUtils; [
    (buildVimPlugin {
      name = "42-header";
      src = pkgs.fetchFromGitHub {
        owner = "Diogo-ss";
        repo = "42-header.nvim";
        rev = "9e816c72712ac72aa576b18a14a5427578c90ff7";
        hash = "sha256-cW+YizhOV9MdwnBrzp2UZj0/CdZ705rxroBldlhc8NI=";
      };
      config = ''
        command! -nargs=0 Stdheader :lua require('42header').header()
        nnoremap <F1> :Stdheader<CR>

        lua << EOF
        require('42header').setup({
          default_map = true,
          auto_update = true,
          user = "dmelnyk",
          mail = "dmelnyk@student.42.fr",
        })
        EOF
      '';
    })
  ];
}
#[
#	 
#	extdd
#  pkgs.vimPlugins."alexandregv/norminette-vim"
#  (pkgs.vimPlugins."Diogo-ss/42-header.nvim".overrideAttrs (oldAttrs: {
#    cmd = [ "Stdheader" ];
#    keys = [ "<F1>" ];
#    opts = {
#      default_map = true;  # Default mapping <F1> in normal mode.
#      auto_update = true;  # Update header when saving.
#      user = "dmelnyk";    # Your user.
#      mail = "dmelnyk@student.42.fr";  # Your mail.
#      # ... add other options ...
#    };
#    config = ''
#      require("42header").setup(opts)
#    '';
#  }))
#]
