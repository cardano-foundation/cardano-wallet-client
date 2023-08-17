{
  inputs.haskellNix.url = "github:input-output-hk/haskell.nix";
  inputs.nixpkgs.follows = "haskellNix/nixpkgs-unstable";
  inputs.flake-utils.url = "github:numtide/flake-utils";
  inputs.openapi3-codegen.url =
    "github:Haskell-OpenAPI-Code-Generator/Haskell-OpenAPI-Client-Code-Generator";
  outputs = { self, nixpkgs, flake-utils, haskellNix, openapi3-codegen }:
    let
      supportedSystems =
        [ "x86_64-linux" "x86_64-darwin" "aarch64-linux" "aarch64-darwin" ];
    in flake-utils.lib.eachSystem supportedSystems (system:
      let
        overlays = [
          haskellNix.overlay
          (final: prev: {
            hsProject = final.haskell-nix.project' {
              name = "cardano-wallet-client";
              src = ./.;
              evalSystem = "x86_64-linux";
              compiler-nix-name = "ghc928";

              # crossPlatforms = p:
              #   pkgs.lib.optionals pkgs.stdenv.hostPlatform.isx86_64 ([
              #     p.mingwW64
              #     # p.ghcjs # TODO GHCJS support for GHC 9.2
              #   ] ++ pkgs.lib.optionals pkgs.stdenv.hostPlatform.isLinux [ p.musl64 ]);

              shell = {
                tools = {
                  cabal = "latest";
                  cabal-fmt = "latest";
                  cabal-hoogle = "latest";
                  hlint = "latest";
                  haskell-language-server = "latest";
                };
                buildInputs = with pkgs; [
                  openapi3-codegen.packages.${system}.default
                  zlib
                  just
                ];
              };
            };
          })
        ];
        pkgs = import nixpkgs {
          inherit system overlays;
          inherit (haskellNix) config;
        };
        flake = pkgs.hsProject.flake { };
      in flake // {
        legacyPackages = pkgs;

        packages.default =
          flake.packages."cardano-wallet-client:exe:cardano-wallet-client";
      });

  # --- Flake Local Nix Configuration ----------------------------
  nixConfig = {
    # This sets the flake to use the IOG nix cache.
    # Nix should ask for permission before using it,
    # but remove it here if you do not want it to.
    extra-substituters = [ "https://cache.iog.io" ];
    extra-trusted-public-keys =
      [ "hydra.iohk.io:f/Ea+s+dFdN+3Y/G+FDgSq+a5NEWhJGzdjvKNGv0/EQ=" ];
    allow-import-from-derivation = "true";
  };
}
