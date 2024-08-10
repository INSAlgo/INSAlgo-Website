{
  description = "Jekyll website template";

  inputs = {
    nixpkgs.url = "github:NixOS/nixpkgs/nixpkgs-unstable";
    flake-utils.url = "github:numtide/flake-utils";
  };

  outputs = { self, nixpkgs, flake-utils, ... }:
    flake-utils.lib.eachDefaultSystem (system:
      let
        pkgs = nixpkgs.legacyPackages.${system};
        minimaPath = pkgs.lib.getLib pkgs.rubyPackages.minima + "/lib/ruby/gems/3.1.0/gems/minima-2.5.1/_sass";
      in
      {
        formatter = pkgs.nixpkgs-fmt;

        # development environment
        devShells.default = pkgs.mkShell {
          buildInputs = [
            pkgs.ruby
            pkgs.rubyPackages.jekyll
            pkgs.rubyPackages.jekyll-sitemap
            pkgs.rubyPackages.minima
          ];

          shellHook = ''
            export SASS_PATH=${minimaPath}
          '';
        };

        packages.default = pkgs.stdenv.mkDerivation {
          name = "jekyll-insalgo-website";
          src = ./.;
          buildInputs = [
            pkgs.ruby
            pkgs.jekyll
            pkgs.rubyPackages.jekyll-sitemap
          ];
          buildPhase = ''
            jekyll build
          '';
          installPhase = ''
            cp -r _site $out
          '';
        };
      }
    );
}
