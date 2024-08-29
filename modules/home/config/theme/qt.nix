{ pkgs, artwork, ... }:
with artwork;
{
  home.sessionVariables = {
    QT_AUTO_SCREEN_SCALE_FACTOR = "1";
    QT_WAYLAND_DISABLE_WINDOWDECORATION = "1";
    QT_QPA_PLATFORM = "wayland;xcb";
    QT_QPA_PLATFORMTHEME = "qt5ct";
    DISABLE_QT5_COMPAT = "0";
  };

  qt = {
    enable = true;
    platformTheme.name = "qtct";
    style = {
      name ="Catppuccin-Mocha";
      package = pkgs.catppuccin-qt5ct;
    };
  };
}
