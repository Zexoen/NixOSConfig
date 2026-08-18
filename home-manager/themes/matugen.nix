{
  pkgs,
  config,
  confDir,
  ...
}:
{
  home.packages = [ pkgs.matugen ];
  xdg.configFile."matugen".source =
    config.lib.file.mkOutOfStoreSymlink "${confDir}/home-manager/themes/matugen";
}
