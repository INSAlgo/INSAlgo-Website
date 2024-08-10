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

          # the following 
          # shellHook = ''
          #   export SASS_PATH=/home/onyr/.local/share/gem/ruby/3.1.0/gems/minima-2.5.1/_sass
          # '';
          shellHook = ''
            export SASS_PATH=/nix/store/vaj5fjqjncjwlmmnmiwcwjx410z7cfcz-ruby3.1-minima-2.5.1/lib/ruby/gems/3.1.0/gems/minima-2.5.1/_sass
          '';
        };

        packages.default = pkgs.stdenv.mkDerivation {
          name = "deltachat-pages";
          src = ./.;
          buildInputs = [
            pkgs.ruby
            pkgs.jekyll
            pkgs.rubyPackages.jekyll-sitemap
          ];
          buildPhase = ''
            jekyll build
          '';
          installPhase = ''cp -r _site $out'';
        };
        
      }
    );
}