{ config, ... }: {
  # NOTE: 敏感环境变量加载 (ai_api_key等)
  age.identityPaths = [
    "${config.home.homeDirectory}/.ssh/id_ed25519"
  ];
  age.secrets."passwd-imap-126" = {
    file = ./passwd-imap-126.age;
  };
  age.secrets."123pan-rclone" = {
    file = ./123pan-rclone.age;
  };
}
