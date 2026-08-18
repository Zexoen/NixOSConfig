{
  config,
  pkgs,
  lib,
  ...
}: {
  i18n.inputMethod = {
    type = "fcitx5";
    enable = true;
    fcitx5.addons = with pkgs; [
      (fcitx5-rime.override {rimeDataPkgs = [rime-ice];})
      qt6Packages.fcitx5-configtool
      qt6Packages.fcitx5-chinese-addons
      fcitx5-mozc
    ];
  };

  i18n.inputMethod.fcitx5.waylandFrontend = true;
  /*
    # 设置rime输入法与美式键盘英文输入法并排序rime第一位
  i18n.inputMethod.fcitx5.settings.inputMethod = {
    GroupOrder."0" = "Default";
    "Groups/0" = {
      Name = "Default";
      "Default Layout" = "us";
      DefaultIM = "keyboard-us";
    };
    "Groups/0/Items/0".Name = "keyboard-us";
    "Groups/0/Items/1".Name = "rime";
  };

  i18n.inputMethod.fcitx5.settings = {
    globalOptions = {
      # "Behavior" = {
      # 关键设置：关闭程序内预编辑，强制使用 Fcitx5 浮窗(能解决 neovide 中无法预编辑的问题)
      # "PreeditEnabledByDefault" = "False";
      # };
      "Hotkey/TriggerKeys" = {"0" = "Super+space";};
    };
  };
  */
}
