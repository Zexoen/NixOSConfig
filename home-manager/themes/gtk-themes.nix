{ config, pkgs, ... }:

let
  myIconThemeName = "Reversal-black-dark";
  myIconTheme = pkgs.reversal-icon-theme.override {
    colorVariants = [ "black" ];
  };

  myGtkThemeName = "adw-gtk3-dark";
  myGtkTheme = pkgs.adw-gtk3;
in
{
  gtk = {
    enable = true; # 必须启用

    theme = {
      name = myGtkThemeName;
      package = myGtkTheme;
    };
    
    iconTheme = {
      name = myIconThemeName;
      package = myIconTheme;
    };

    # 针对特定版本的GTK进行额外配置
    gtk3 = {
      extraConfig = {
        gtk-application-prefer-dark-theme = true;
        gtk-font-name = "LXGW WenKai";
      };
    };
    gtk4 = {
      extraConfig = {
        gtk-application-prefer-dark-theme = true;
      };
    };
  };

  # 对于 GTK4，部分设置需要通过 dconf 生效
  dconf.settings = {
    "org/gnome/desktop/interface" = {
      gtk-theme = myGtkThemeName;
      color-scheme = "prefer-dark";
    };
  };
}
