{ config, inputs, pkgs, lib, vars, ... }:
with lib;
{
  fonts.packages = with pkgs; [   
    noto-fonts
    noto-fonts-cjk
    noto-fonts-cjk-sans
    font-awesome
    material-symbols
    fira-code
    source-code-pro
    jetbrains-mono
    ubuntu_font_family
    nerdfonts
  ];
}

