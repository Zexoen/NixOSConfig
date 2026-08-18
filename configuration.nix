# Edit this configuration file to define what should be installed on
# your system. Help is available in the configuration.nix(5) man page, on
# https://search.nixos.org/options and in the NixOS manual (`nixos-help`).
{
  config,
  lib,
  pkgs,
  inputs,
  ...
}:
{
  imports = [
    # Include the results of the hardware scan.
    ./hardware-configuration.nix
    ./modules
  ];

  # Enable Btrfs Compress
  fileSystems."/".options = [ "compress=zstd" ];
  fileSystems."/home".options = [ "compress=zstd" ];
  fileSystems."/nix".options = [
    "compress=zstd"
    "noatime"
  ];

  nixpkgs.config.allowUnfree = true;
  nix.settings.substituters = [ "https://mirrors.ustc.edu.cn/nix-channels/store" ];
  nix.settings.experimental-features = [
    "flakes"
    "nix-command"
  ];

  # Garbage collection
  nix.gc = {
    automatic = lib.mkDefault true;
    dates = lib.mkDefault "weekly";
    options = lib.mkDefault "--delete-older-than 7d";
  };

  nix.settings.auto-optimise-store = true;

  # Use the systemd-boot EFI boot loader.
  boot.loader.systemd-boot.enable = true;
  boot.loader.efi.canTouchEfiVariables = true;
  # Use latest kernel
  boot.kernelPackages = pkgs.linuxPackages_latest;
  # Clean legacy generations
  boot.loader.systemd-boot.configurationLimit = 10;
  # Disable watchdog
  boot.kernelParams = [
    "nowatchdog"
  ];
  boot.blacklistedKernelModules = [ "sp5100_tco" ];

  # Enable zram
  zramSwap.enable = true;

  # Set your time zone.
  time.timeZone = "Asia/Shanghai";

  # Select internationalisation properties.
  i18n.defaultLocale = "en_US.UTF-8";
  # console = {
  #   font = "Lat2-Terminus16";
  #   keyMap = "us";
  #   useXkbConfig = true; # use xkb.options in tty.
  # };

  # Fonts
  fonts.packages = with pkgs; [
    maple-mono.NF-CN

    lxgw-wenkai

    noto-fonts
    noto-fonts-cjk-sans
    noto-fonts-color-emoji
  ];

  fonts = {
    enableDefaultPackages = true;
    fontconfig = {
      enable = true;
      defaultFonts = {
        serif = [ "LXGW Wenkai" ];
        sansSerif = [ "LXGW Wenkai" ];
        monospace = [ "Maple Mono NF CN" ];
      };
    };
  };

  # DMS
  programs.dms-shell.enable = true;

  # Niri
  programs.niri.enable = true;
  programs.xwayland = {
    enable = true;
    package = pkgs.xwayland-satellite;
  };

  services.displayManager.dms-greeter = {
    enable = true;
    compositor.name = "niri";
    configHome = "/home/zexoen";
  };

  # Enable CUPS to print documents.
  # services.printing.enable = true;

  # Enable sound.
  # services.pulseaudio.enable = true;
  # OR
  security.rtkit.enable = true;
  services.pipewire = {
    enable = true;
    pulse.enable = true;
  };

  hardware.bluetooth.enable = true;
  services.power-profiles-daemon.enable = true;
  services.upower.enable = true;
  services.udisks2.enable = true;

  # Enable touchpad support (enabled default in most desktopManager).
  # services.libinput.enable = true;

  # Define a user account. Don't forget to set a password with ‘passwd’.
  users.users.zexoen = {
    isNormalUser = true;
    extraGroups = [ "wheel" ]; # Enable ‘sudo’ for the user.
    openssh.authorizedKeys.keys = [
      "ssh-ed25519 AAAAC3NzaC1lZDI1NTE5AAAAIGSO5t6WyJODki3cPkjvs+wg5/Sl5BYuNfyT2j/GnHCm zexoen@ArchLinux"
    ];
    hashedPassword = "$y$j9T$FmF9Zv00xzwmWzu/JLbpT0$6IDRD7SV30KArxZywvcNXwmVeUVGhInY84TBp8eOLy9";
    shell = pkgs.zsh;
  };

  programs.zsh.enable = true;
  programs.zsh.autosuggestions.enable = true;
  programs.zsh.syntaxHighlighting.enable = true;

  programs.wshowkeys = {
    enable = true;
    package = inputs.wshowkeys.packages.${pkgs.stdenv.hostPlatform.system}.default;
  };
  programs.steam.enable = true;
  programs.fuse = {
    enable = true;
    userAllowOther = true;
  };

  # List packages installed in system profile.
  # You can use https://search.nixos.org/ to find more packages (and options).
  environment.systemPackages = with pkgs; [
    vim # Do not forget to add an editor to edit configuration.nix! The Nano editor is also installed by default.
    wget
    git
    fastfetch
    yazi
    rclone
    btop
    python3
  ];

  # Enable Terminfo
  environment.enableAllTerminfo = true;

  # Environment Variables
  environment.sessionVariables = {
    EDITOR = "vim";
    NIXOS_OZONE_WL = "1";
    TERMINAL = "kitty";
    XMODIFIERS = "@im=fcitx";
    QT_IM_MODULE = "fcitx";
  };

  # Sudoer No Password
  security.sudo.wheelNeedsPassword = false;

  # Some programs need SUID wrappers, can be configured further or are
  # started in user sessions.
  # programs.mtr.enable = true;
  # programs.gnupg.agent = {
  #   enable = true;
  #   enableSSHSupport = true;
  # };

  # List services that you want to enable:

  # Enable the OpenSSH daemon.
  services.openssh.enable = true;
  services.timesyncd.enable = true;

  # services.hardware.openrgb.enable = true;

  # This option defines the first version of NixOS you have installed on this particular machine,
  # and is used to maintain compatibility with application data (e.g. databases) created on older NixOS versions.
  #
  # Most users should NEVER change this value after the initial install, for any reason,
  # even if you've upgraded your system to a new NixOS release.
  #
  # This value does NOT affect the Nixpkgs version your packages and OS are pulled from,
  # so changing it will NOT upgrade your system - see https://nixos.org/manual/nixos/stable/#sec-upgrading for how
  # to actually do that.
  #
  # This value being lower than the current NixOS release does NOT mean your system is
  # out of date, out of support, or vulnerable.
  #
  # Do NOT change this value unless you have manually inspected all the changes it would make to your configuration,
  # and migrated your data accordingly.
  #
  # For more information, see `man configuration.nix` or https://nixos.org/manual/nixos/stable/options#opt-system.stateVersion .
  system.stateVersion = "26.05"; # Did you read the comment?
}
