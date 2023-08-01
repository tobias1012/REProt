{
  description = "A basic flake with a shell";
  inputs.nixpkgs.url = "github:NixOS/nixpkgs/nixpkgs-unstable";
  inputs.flake-utils.url = "github:numtide/flake-utils";

  outputs = { self, nixpkgs, flake-utils }:
    flake-utils.lib.eachDefaultSystem (system: let
      pkgs = nixpkgs.legacyPackages.${system};
    in {
      devShells.default = pkgs.mkShell {
        packages = with pkgs; [ 
          rustc
          rustfmt
          cargo
          cargo-tauri
          yarn
          rust-analyzer
          openssl
          libsoup
          gdk-pixbuf
          pkgconfig
          glib
          cairo
          pango
          webkitgtk
          glib-networking
        ];
	shellHook = ''
	  yarn install
    	  alias dev="GDK_BACKEND=x11 yarn tauri dev"
	'';
      };
    });
}
