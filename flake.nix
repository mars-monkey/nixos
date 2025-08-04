{
  description = "new flake";

  inputs = {
    nixpkgs.url = "github:nixos/nixpkgs/nixos-25.05";
  };

  outputs = { nixpkgs, ... }@inputs: {
    nixosConfigurations = {
      "dell7506" = nixpkgs.lib.nixosSystem {
        modules = [
          ./hosts/dell7506
        ];
      };
    };
  };
}
