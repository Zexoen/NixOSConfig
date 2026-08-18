{ config, confDir, ... }:

{
  imports = [
    ./cursor.nix
    ./gtk-themes.nix
    ./qt-themes.nix
    ./matugen.nix
  ];

  home.file."Pictures/WallPaper".source =
    config.lib.file.mkOutOfStoreSymlink "${confDir}/home-manager/themes/WallPaper";
}
