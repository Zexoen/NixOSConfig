{
  pkgs,
  pkgs-stable,
  ...
}:
{
  home.packages = with pkgs; [
    (wechat.overrideAttrs {
      src = fetchurl {
        url = "https://dldir1v6.qq.com/weixin/Universal/Linux/WeChatLinux_x86_64.AppImage";
        hash = "sha256-RX26ArkbAxzdRBLu4HT7v/udnQax5Q/Bgi00hw4RSZA=";
      };
    })
    qq
    obsidian
    spotify
    nautilus
    kitty
    localsend
    obs-studio
    telegram-desktop
    kazumi
    rnote
    foliate
    upscaler
    wpsoffice-cn
    onlyoffice-desktopeditors
    decibels
    # komikku
    hmcl
    pavucontrol
  ];

  programs.firefox = {
    enable = true; # 安装并启用 Firefox
    languagePacks = [ "zh-CN" ]; # 中文语言包，可按需加其他
    profiles.default = {
      name = "default"; # 默认 profile 名称
      isDefault = true; # 设置为默认 profile
      settings = {
        "privacy.donottrackheader.enabled" = true; # 开启“请勿跟踪”
        "ui.key.menuAccessKeyFocuses" = false;
        "browser.display.use_document_fonts" = 0;
      };
    };
  };

  programs.mpv.enable = true;
}
