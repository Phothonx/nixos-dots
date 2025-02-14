{
  description = ''My personal config flake'';

  inputs = {
    # NixPkgs
    nixpkgs.url = "github:nixos/nixpkgs/nixos-unstable";
    nixpkgs-stable.url = "github:nixos/nixpkgs/nixos-24.05";

    # Home manager
    home-manager.url = "github:nix-community/home-manager";
    home-manager.inputs.nixpkgs.follows = "nixpkgs";

    # NUR
    nur.url = "github:nix-community/NUR";
    nur.inputs.nixpkgs.follows = "nixpkgs";

    # Hardware
    nixos-hardware.url = "github:NixOS/nixos-hardware/master";

    # Agenix
    agenix.url = "github:ryantm/agenix";
    agenix.inputs.nixpkgs.follows = "nixpkgs";

    # Nix-index database
    nix-index-database.url = "github:nix-community/nix-index-database";
    nix-index-database.inputs.nixpkgs.follows = "nixpkgs";

    # Devshells
    nix-devshells.url = "github:Phothonx/nix-devshells";
    nix-devshells.inputs.nixpkgs.follows = "nixpkgs";
  };

  outputs = {
    self,
    nixpkgs,
    home-manager,
    ...
  } @ inputs: let
    inherit (self) outputs;
    lib = nixpkgs.lib // home-manager.lib;

    systems = [
      "x86_64-linux"
    ];

    pkgsFor = lib.genAttrs systems (
      system:
        import nixpkgs {
          inherit system;
          config.allowUnfree = true;
        }
    );
    forEachSystem = f: lib.genAttrs systems (system: f pkgsFor.${system});
    mkNixosSystems = hostNames:
      lib.genAttrs hostNames (hostName:
        lib.nixosSystem {
          modules = [./hosts/${hostName}/configuration.nix];
          specialArgs = {inherit self inputs outputs hostName;};
        });
  in {
    nixosModules = import ./modules/nixos;
    homeManagerModules = import ./modules/home;

    overlays = import ./overlays {inherit inputs;};

    packages = forEachSystem (pkgs: import ./packages pkgs);
    formatter = forEachSystem (pkgs: pkgs.alejandra);
    nixosConfigurations = mkNixosSystems [
      "avalon" # laptop
      # "crystal" # raspi3
    ];
  };
}
