{ pkgs, ... }:
{
  home.packages = with pkgs; [
    mindustry-wayland
  ];
}
