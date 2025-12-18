{
  description = "System flake";

  inputs = {
    nixpkgs = {
      type = "github";
      owner = "NixOS";
      repo = "nixpkgs";
      ref = "nixos-unstable";
    };

    impermanence = {
      type = "github";
      owner = "nix-community";
      repo = "impermanence";
    };

    hjem = {
      type = "github";
      owner = "feel-co";
      repo = "hjem";
    };

    aagl = {
      type = "github";
      owner = "ezKEa";
      repo = "aagl-gtk-on-nix";
      inputs.nixpkgs.follows = "nixpkgs";
    };

    dgop = {
      type = "github";
      owner = "AvengeMedia";
      repo = "dgop";
      inputs.nixpkgs.follows = "nixpkgs";
    };

    dms = {
      type = "github";
      owner = "AvengeMedia";
      repo = "DankMaterialShell";
      inputs = {
        nixpkgs.follows = "nixpkgs";
        dgop.follows = "dgop";
      };
    };

    helix = {
      type = "github";
      owner = "helix-editor";
      repo = "helix";
      inputs.nixpkgs.follows = "nixpkgs";
    };

    niri = {
      type = "github";
      owner = "sodiboo";
      repo = "niri-flake";
      inputs.nixpkgs.follows = "nixpkgs";
    };

    declarative-flatpak = {
      type = "github";
      owner = "in-a-dil-emma";
      repo = "declarative-flatpak";
    };
  };

  outputs = {
    self,
    nixpkgs,
    ...
  } @ inputs: {
    nixosConfigurations = {
      seer = nixpkgs.lib.nixosSystem {
        system = "x86_64-linux";
        specialArgs = {inherit inputs;};
        modules = [
          ./common
          ./hosts/seer
        ];
      };
    };
  };
}
