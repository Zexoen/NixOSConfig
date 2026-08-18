{
  pkgs,
  confDir,
  config,
  ...
}:
let
  nvimConf = "${confDir}/home-manager/editor/nvim";
in
{
  home.packages = with pkgs; [
    neovim
    lua-language-server
    nil
    nixfmt
    pyright
    rust-analyzer
  ];
  xdg.configFile."nvim/init.lua".source = config.lib.file.mkOutOfStoreSymlink "${nvimConf}/init.lua";
  xdg.configFile."nvim/lua".source = config.lib.file.mkOutOfStoreSymlink "${nvimConf}/lua";
  xdg.configFile."nvim/nvim-pack-lock.json".source =
    config.lib.file.mkOutOfStoreSymlink "${nvimConf}/nvim-pack-lock.json";
}
