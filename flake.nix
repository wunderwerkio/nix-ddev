{
  description = "DDEV";

  inputs = {
    nixpkgs.url = "github:nixos/nixpkgs/nixos-23.05";
    ww-utils.url = "github:wunderwerkio/nix-ww-utils";
  };

  outputs = {
    self,
    nixpkgs,
    ww-utils,
    ...
  }: let
    systems = [
      # Linux machines
      "x86_64-linux"
      "aarch64-linux"
      # MacOS machines
      "x86_64-darwin"
      "aarch64-darwin"
    ];
    forEachSystem = nixpkgs.lib.genAttrs systems;
  in {
    packages = forEachSystem (
      system: let
        pkgs = nixpkgs.legacyPackages.${system};
        ddev = pkgs.callPackage ./package/default.nix {inherit nixpkgs system;};
      in {
        inherit ddev;
        default = ddev;
      }
    );

    defaultPackage = forEachSystem (system: self.packages.${system}.ddev);

    formatter = ww-utils.lib.forEachWunderwerkSystem (
      system:
        nixpkgs.legacyPackages.${system}.alejandra
    );
  };
}
