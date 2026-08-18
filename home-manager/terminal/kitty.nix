{ config, pkgs, ... }:

{
  programs.kitty = {
    enable = true;

    # Theme settings (Catppuccin-Macchiato)
    settings = {
      # Basic colors
      foreground = "#CAD3F5";
      background = "#24273A";
      selection_foreground = "#24273A";
      selection_background = "#F4DBD6";

      # Cursor colors
      cursor = "#F4DBD6";
      cursor_text_color = "#24273A";

      # URL color
      url_color = "#F4DBD6";

      # Window border colors
      active_border_color = "#B7BDF8";
      inactive_border_color = "#6E738D";
      bell_border_color = "#EED49F";

      # Tab bar colors
      active_tab_foreground = "#181926";
      active_tab_background = "#C6A0F6";
      inactive_tab_foreground = "#CAD3F5";
      inactive_tab_background = "#1E2030";
      tab_bar_background = "#181926";

      # Mark colors
      mark1_foreground = "#24273A";
      mark1_background = "#B7BDF8";
      mark2_foreground = "#24273A";
      mark2_background = "#C6A0F6";
      mark3_foreground = "#24273A";
      mark3_background = "#7DC4E4";

      # Terminal colors
      color0 = "#494D64";
      color8 = "#5B6078";
      color1 = "#ED8796";
      color9 = "#ED8796";
      color2 = "#A6DA95";
      color10 = "#A6DA95";
      color3 = "#EED49F";
      color11 = "#EED49F";
      color4 = "#8AADF4";
      color12 = "#8AADF4";
      color5 = "#F5BDE6";
      color13 = "#F5BDE6";
      color6 = "#8BD5CA";
      color14 = "#8BD5CA";
      color7 = "#B8C0E0";
      color15 = "#A5ADCB";

      # Font settings
      font_size = 13;
      font_family = "family='Maple Mono NF CN' postscript_name=MapleMono-NF-CN-ExtraLight";
      bold_font = "family='Maple Mono NF CN' postscript_name=MapleMono-NF-CN-Bold";
      italic_font = "family='Maple Mono NF CN' postscript_name=MapleMono-NF-CN-Italic";
      bold_italic_font = "family='Maple Mono NF CN' postscript_name=MapleMono-NF-CN-BoldItalic";

      # Window settings
      hide_window_decorations = "yes";
      window_padding_width = 5;
      background_opacity = 0.8;
      confirm_os_window_close = 0;
      background_blur = 30;

      # Tab bar settings
      tab_bar_edge = "top";
      tab_bar_style = "powerline";
      tab_powerline_style = "slanted";
    };

    # Use extraConfig for font_features since it expects a multi-line string
    extraConfig = ''
      # Font features
      font_features MapleMono-NF-CN-ExtraLight +cv01 +ss04 +ss05 +zero
      font_features MapleMono-NF-CN-Bold +cv01 +ss04 +ss05 +zero
      font_features MapleMono-NF-CN-Italic +cv01 +ss04 +ss05 +zero
      font_features MapleMono-NF-CN-BoldItalic +cv01 +ss04 +ss05 +zero
    '';
  };
}
