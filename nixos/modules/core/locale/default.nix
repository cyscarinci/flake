{ config, inputs, pkgs, lib, vars, ... }:
with lib;
{
  options = {
    modules.hangul_input = mkOption {
      type = types.bool;
      default = false;
    };
  };
  config = mkMerge [(
  # mkIf ( config.modules.network )
  {
    time.timeZone = "${vars.timeZone}";
  
    i18n = {
      defaultLocale = "${vars.defaultLocale}"+".UTF-8";
      extraLocaleSettings = {
        LC_ADDRESS = "${vars.extraLocale}"+".UTF-8";
        LC_IDENTIFICATION = "${vars.extraLocale}"+".UTF-8";
        LC_MEASUREMENT = "${vars.extraLocale}"+".UTF-8";
        LC_MONETARY = "${vars.extraLocale}"+".UTF-8";
        LC_NAME = "${vars.extraLocale}"+".UTF-8";
        LC_NUMERIC = "${vars.extraLocale}"+".UTF-8";
        LC_PAPER = "${vars.extraLocale}"+".UTF-8";
        LC_TELEPHONE = "${vars.extraLocale}"+".UTF-8";
        LC_TIME = "${vars.extraLocale}"+".UTF-8";
      };
    };
    # Configure keymap in X11
    services.xserver = {
      layout = "kr";
      xkbVariant = "";
    };
  })
  (mkIf ( config.modules.hangul_input ) {
    i18n.inputMethod = { enabled = "ibus"; ibus.engines = with pkgs.ibus-engines; [ hangul ]; }; 
  })];
}

