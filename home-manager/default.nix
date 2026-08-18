{
  config,
  pkgs,
  ...
}:
{
  imports = [
    ./editor
    ./niri
    ./programs
    ./themes
    ./fcitx5
    ./music
    ./opencode
    ./terminal
    ./develop
    ./secrets
  ];
  home.username = "zexoen";
  home.homeDirectory = "/home/zexoen";

  home.stateVersion = "26.05";
}
