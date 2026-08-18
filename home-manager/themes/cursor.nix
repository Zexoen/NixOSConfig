{ config, pkgs, ... }:

{
  home.pointerCursor = {
    enable = true;
    # 主题名称，需与包内定义的一致
    name = "graphite-dark";
    # 主题所在的 Nix 包，例如来自 nixpkgs
    package = pkgs.graphite-cursors;
    # 指针大小
    size = 27;
    # 为 GTK 应用启用该主题
    gtk.enable = true;
    # 为 X11 应用启用该主题
    x11.enable = true;
  };
}
