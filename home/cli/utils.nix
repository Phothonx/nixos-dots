{ pkgs, ... }:
{
  home.packages = with pkgs;
    [
      # Nix
      nvd
      nix-output-monitor
      nix-tree

      # CLI Tools
      imagemagick
      yt-dlp
      cfspeedtest
      duf
      zip
      unzip
      unrar
      glow
      wev

      # Quality of life
      ripgrep
      fzf
      yazi
      fd
      catimg
      rsync

      # Fun fetching
      cowsay
      pipes
      cbonsai
      cmatrix
      lolcat
      nitch
    ];

  programs = {
    zoxide = {
      enable = true;
      enableBashIntegration = true;
    };

    eza = {
      enable = true;
      icons = true;
      extraOptions = [
        "--group-directories-first"
        "--header"
      ];
    };

    bat = {
      enable = true;
      config = {
        theme = "base16";
        pager = "less -FR";
      };
    };
  };
}
