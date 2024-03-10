{ pkgs, ... }:
{
  home.packages = [ pkgs.hyprshade ];

  home.file.".config/hypr/hyprshade.toml".text = ''
    [[shades]]
    name = "unfiltered"
    default = true  # shader to use during times when there is no other shader scheduled

    [[shades]]
    name = "blue-light-filter"
    start_time = 20:00:00
    end_time = 07:00:00   # optional if you have more than one shade with start_time
  '';
}