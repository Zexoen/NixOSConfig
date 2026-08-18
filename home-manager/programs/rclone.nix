{ config, ... }: {
  programs.rclone = {
    enable = true;
    remotes."123pan" = {
      config = {
        type = "webdav";
        url = "https://webdav.123pan.com/webdav";
        vendor = "other";
        user = "18400160318";
      };
      secrets = {
        pass = config.age.secrets."123pan-rclone".path;
      };
      mounts."/" = {
        enable = true; # 启用该挂载
        autoMount = true; # 开机自动挂载（或用户登录时自动启动）
        mountPoint = "${config.home.homeDirectory}/123pan"; # 本地挂载目录

        options = {
          allow-other = true;
          vfs-cache-mode = "writes";
          rc = true;
          rc-addr = "127.0.0.1:5572";
          rc-no-auth = true;
        };
      };
    };
  };
}
