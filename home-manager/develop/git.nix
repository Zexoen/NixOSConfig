{ pkgs, ... }:

{
  programs.git = {
    enable = true; # 启用 Git
    settings = {
      user = {
        name = "Zexoen"; # 替换为你的 Git 用户名
        email = "zexoen@126.com"; # 替换为你的邮箱
      };
      init.defaultBranch = "main"; # 设置默认初始分支为 main
    };
  };
}
