{
  config,
  pkgs,
  lib,
  ...
}:
{
  wayland.windowManager.hyprland.settings = {

    animations = {
      enabled = true;
      bezier = [
        # https://easings.net/
        "myBezier, .5, .25, 0, 1"
        "quart, 0.25, 1, 0.5, 1"
        "linear, 0.0, 0.0, 1.0, 1.0"
      ];

      animation = [
        "windows, 1, 2.5, myBezier, popin 80%"
        "border, 1, 2.5, myBezier"
        "fade, 1, 2.5, myBezier"
        "borderangle, 1, 6, quart"
        "workspaces, 1, 2.5, myBezier, slidefade 20%"
        # "borderangle, 1, 100, linear, loop"
      ];

      layerrule = [
        "animation slide, launcher"
      ];

    };
  };
}
