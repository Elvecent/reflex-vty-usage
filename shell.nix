{ doBenchmark ? false }:

let

  pkgs = import ./reflex-platform {};

  f = { mkDerivation, base, reflex, reflex-vty,
        vty, patch, containers, text, stdenv }:
      mkDerivation {
        pname = "eh";
        version = "0.1.0.0";
        src = ./.;
        isLibrary = false;
        isExecutable = true;
        executableHaskellDepends =
          [ base reflex-vty vty text containers patch reflex ];
        license = stdenv.lib.licenses.bsd3;
      };

  haskellPackages = pkgs.ghc;

in

(haskellPackages.callPackage f {}).env
