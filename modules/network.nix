_: {
  networking.hostName = "nixos"; # Define your hostname.

  networking.hosts = {
    "101.37.21.33" = [ "ali-server" ];
  };

  # Configure network connections interactively with nmcli or nmtui.
  networking.networkmanager.enable = true;

  programs.clash-verge = {
    enable = true;
    autoStart = true;
    tunMode = true;
    serviceMode = true;
  };

  # Configure network proxy if necessary
  # networking.proxy = {
  #   default = "http://127.0.0.1:7897";
  #   httpProxy = "http://127.0.0.1:7897";
  #   httpsProxy = "http://127.0.0.1:7897";
  #   noProxy = "localhost,127.0.0.1,::1,*.local,*.zju.*";
  # };
  # Open ports in the firewall.
  # networking.firewall.allowedTCPPorts = [ ... ];
  # networking.firewall.allowedUDPPorts = [ ... ];
  # Or disable the firewall altogether.
  # networking.firewall.enable = false;
}
