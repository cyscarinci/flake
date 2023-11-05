{ config, inputs, pkgs, lib, vars, ... }:
with lib;
{
  options = {
    modules.xdg = mkOption {
      type = types.bool;
      default = false;
    };
  };
  config = mkIf ( config.modules.xdg ) {
    home-manager.users.${vars.user} = {
      xdg = { enable = true;
        userDirs = {
          enable = true;
          createDirectories = true;
          music = "${vars.homeDirectory}/Media/Music";
          videos = "${vars.homeDirectory}/Media/Videos";
          pictures = "${vars.homeDirectory}/Media/Pictures";
          download = "${vars.homeDirectory}/Downloads";
          documents = "${vars.homeDirectory}/Projects";
          desktop = null;
          templates = null;
          publicShare = null;
          extraConfig = {
            XDG_DOTFILES_DIR = "${vars.homeDirectory}/.dotfiles";
            XDG_BOOK_DIR = "${vars.homeDirectory}/Media/Books";
          };
        };
      };
    };
  };
}
