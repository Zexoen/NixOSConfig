# Capslock Re-mapping
_: {
  services.keyd = {
    enable = true;

    keyboards = {
      default = {
        ids = [ "*" ];
        settings = {
          main = {
            capslock = "overload(nav, esc)";
          };
          nav = {
            h = "left";
            j = "down";
            k = "up";
            l = "right";
            i = "pageup";
            u = "pagedown";
            space = "playpause";
            f = "nextsong";
            d = "previoussong";
            s = "mute";
            e = "volumeup";
            w = "volumedown";
          };
        };
      };
    };
  };
}
