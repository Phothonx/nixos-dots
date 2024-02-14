{

  description = ''
  █▀█ █░█ █▀█ ▀█▀ █░█ █▀█ █▄░█ ▀▄▀   ▄▄   █▄░█ █ ▀▄▀ █▀█ █▀   █▀▀ █░░ ▄▀█ █▄▀ █▀▀   █▀▀ █▀█ █▄░█ █▀▀ █ █▀▀
  █▀▀ █▀█ █▄█ ░█░ █▀█ █▄█ █░▀█ █░█   ░░   █░▀█ █ █░█ █▄█ ▄█   █▀░ █▄▄ █▀█ █░█ ██▄   █▄▄ █▄█ █░▀█ █▀░ █ █▄█
  '';

  inputs = {

    nixpkgs.url = "github:nixos/nixpkgs/nixos-unstable";

    home-manager = {
      url = "github:nix-community/home-manager";
      inputs.nixpkgs.follows = "nixpkgs";
    };

    nix-colors.url = "github:misterio77/nix-colors";

    hyprland.url = "github:hyprwm/Hyprland";

    # hyprland-plugins = {
    #   url = "github:hyprwm/hyprland-plugins";
    #   inputs.nixpkgs.follows = "nixpkgs";
    # };

    # hycov = {
    #   url = "github:DreamMaoMao/hycov";
    #   inputs.hyprland.follows = "hyprland";
    # };
    # 
    # hyprfocus = {
    #   url = "github:VortexCoyote/hyprfocus";
    #   inputs.hyprland.follows = "hyprland";
    # };

    ags.url = "github:Aylur/ags";

    firefox-addons = {
      url = "gitlab:rycee/nur-expressions?dir=pkgs/firefox-addons";
      inputs.nixpkgs.follows = "nixpkgs";
    };
    
  };

  outputs = { self, nixpkgs, ... }@inputs:
  let
    systemConfig = {
      system = "x86_64-linux";
      hostName = "avalon";
      timeZone = "Europe/Paris";
      locale = "en_US.UTF-8";
      layout = "fr";
    };

    userConfig = {
      userName = "nico";
      name = "Nicolas";
      email = "";
      theme = "";
      accent = "";
    };

  in 
  {
    nixosConfigurations = import ./nixos { inherit self nixpkgs inputs systemConfig userConfig; };
  };

}