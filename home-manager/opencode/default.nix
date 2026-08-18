{ config, confDir, ... }: {
  programs.opencode = {
    enable = true;
  };
  xdg.configFile."opencode/skills".source =
    config.lib.file.mkOutOfStoreSymlink "${confDir}/home-manager/opencode/skills";
}
