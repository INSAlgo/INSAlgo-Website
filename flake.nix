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
        minima = pkgs.rubyPackages.minima;
        minimaVersion = builtins.getAttr "version" minima;
        minimaPath = "${minima}/lib/ruby/gems/3.1.0/gems/minima-${minimaVersion}/_sass";
      in
      {
        formatter = pkgs.nixpkgs-fmt;

        # development environment
        devShells.default = pkgs.mkShell {
          buildInputs = [
            pkgs.ruby
            pkgs.rubyPackages.jekyll
            pkgs.rubyPackages.jekyll-sitemap
            minima
          ];

          shellHook = ''
            if [ ! -d "${minimaPath}" ]; then
              echo "Error: The SASS_PATH (${minimaPath}) does not exist."
              exit 1
            else
              export SASS_PATH=${minimaPath}
            fi
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
