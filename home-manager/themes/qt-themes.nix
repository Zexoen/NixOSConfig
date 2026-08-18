{ config, pkgs, lib, ... }:

{
  home.packages = [ pkgs.kdePackages.qt6ct ];

  qt.enable = true;
  
  home.sessionVariables = {
    QT_QPA_PLATFORMTHEME = "qt6ct";
    QT_QPA_PLATFORMTHEME_QT6 = "qt6ct";
    QS_ICON_THEME = "Reversal-black-dark";
  };
}
