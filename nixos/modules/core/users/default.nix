{ config, inputs, pkgs, lib, vars, ... }:
with lib;
{
  users.users.${vars.user} = {
    isNormalUser = true;
    description = "${vars.userName}";
    extraGroups = [ "wheel" "networkmanager" ];
  };

  home-manager.users.${vars.user} = {
    home.sessionVariables = {
      TERM = "${vars.term}";
      SHELL = "${vars.shell}";
      EDITOR = "${vars.editor}";
      BROWSER = "${vars.browser}";
    };
    programs.git = {
      enable = true;
      userName = "${vars.userName}";
      userEmail = "${vars.userEmail}";
      extraConfig = { init.defaultBranch = "main"; };
    };
    
    home.stateVersion = "23.05";
    programs.home-manager.enable = true;
  };
}

