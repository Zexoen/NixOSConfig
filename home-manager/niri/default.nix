{ config, confDir, ... }:
let
  niriConf = "${confDir}/home-manager/niri";
in
{
  xdg.configFile."niri/config.kdl".source =
    config.lib.file.mkOutOfStoreSymlink "${niriConf}/config.kdl";
  xdg.configFile."niri/binds.kdl".source =
    config.lib.file.mkOutOfStoreSymlink "${niriConf}/binds.kdl";
  xdg.configFile."niri/rules.kdl".source =
    config.lib.file.mkOutOfStoreSymlink "${niriConf}/rules.kdl";
  xdg.configFile."niri/scripts".source = config.lib.file.mkOutOfStoreSymlink "${niriConf}/scripts";
}
