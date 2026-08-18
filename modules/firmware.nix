{ config, ... }: {
  hardware = {
    enableAllFirmware = true; # 自动安装所有固件
    # cpu.intel.updateMicrocode = true; # Intel CPU
    cpu.amd.updateMicrocode = true; # AMD CPU
  };

  services.xserver.enable = true;
  services.xserver.videoDrivers = [
    "amdgpu"
    "nvidia"
  ];

  hardware.nvidia = {
    modesetting.enable = true;
    nvidiaSettings = true;

    package = config.boot.kernelPackages.nvidiaPackages.stable;

    open = true;

    prime = {
      offload = {
        enable = true;
        enableOffloadCmd = true; # 提供 nvidia-offload 命令
      };

      amdgpuBusId = "PCI:6:0:0"; # 06:00.0 → PCI:6:0:0
      nvidiaBusId = "PCI:1:0:0"; # 01:00.0 → PCI:1:0:0
    };
  };

  hardware.graphics = {
    enable = true;
    enable32Bit = true;
  };
}
