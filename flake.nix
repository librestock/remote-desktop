{
  inputs = {
    nixpkgs.url = "github:NixOS/nixpkgs/nixpkgs-unstable";
    flake-utils.url = "github:numtide/flake-utils";
  };

  outputs = {
    self,
    nixpkgs,
    flake-utils,
  }:
    flake-utils.lib.eachDefaultSystem (system: let
      pkgs = nixpkgs.legacyPackages.${system};

      libraries = with pkgs; [
        webkitgtk_4_1
        gtk3
        glib
        libsoup_3
        cairo
        gdk-pixbuf
        pango
        harfbuzz
        librsvg
        at-spi2-atk
        atkmm
        dbus
        openssl
        glib-networking
      ];
    in {
      devShells.default = pkgs.mkShell {
        nativeBuildInputs = with pkgs; [
          pkg-config
          gobject-introspection
          cargo-tauri
        ];

        buildInputs =
          [
            pkgs.nodejs_latest
          ]
          ++ libraries;

        shellHook = ''
          export LD_LIBRARY_PATH="${pkgs.lib.makeLibraryPath libraries}:$LD_LIBRARY_PATH"
          export GIO_MODULE_PATH="${pkgs.glib-networking}/lib/gio/modules"
        '';
      };
    });
}
