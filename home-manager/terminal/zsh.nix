{ config, pkgs, ... }:

{
  programs.zsh = {
    enable = true;

    enableCompletion = true;
    autosuggestion.enable = true;
    syntaxHighlighting.enable = true;

    # 配置历史记录
    history = {
      size = 10000;
      save = 10000;
      path = "${config.home.homeDirectory}/.zsh_history";
      ignoreDups = true;
      ignoreSpace = true;
      extended = true;
    };

    # 环境变量
    sessionVariables = {
      PATH = "$PATH:${config.home.homeDirectory}/.local/bin";
      UV_DEFAULT_INDEX = "https://pypi.tuna.tsinghua.edu.cn/simple";
      GVIM_ENABLE_WAYLAND = "1";
    };

    # 插件
    plugins = [
      {
        name = "vi-mode";
        src = pkgs.zsh-vi-mode;
        file = "share/zsh-vi-mode/zsh-vi-mode.plugin.zsh";
      }
    ];

    # 初始化脚本（在 .zshrc 中执行的代码）
    initContent = ''
      # 开启tab上下左右选择补全
      zstyle ':completion:*' menu select
      autoload -Uz compinit
      compinit

      # Yazi 函数
      function y() {
        local tmp="$(mktemp -t "yazi-cwd.XXXXXX")" cwd
        command yazi "$@" --cwd-file="$tmp"
        IFS= read -r -d \'\' cwd < "$tmp"
        [ "$cwd" != "$PWD" ] && [ -d "$cwd" ] && builtin cd -- "$cwd"
        rm -f -- "$tmp"
      }

      # tree directory list with eza
      lt() {
        if [ $# -eq 0 ]; then
          eza --tree --icons -L 3
        else
          eza --tree --icons -L "$1"
        fi
      }

      # zoxide
      eval "$(zoxide init zsh)"
    '';
  };

  # 安装必要的包
  home.packages = with pkgs; [
    zoxide # 智能 cd
    eza # 现代化的 ls
  ];
}
