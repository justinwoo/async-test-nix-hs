{ pkgs ? import <nixpkgs> {} }:

let
  ghc = pkgs.ghc.withPackages (x: [
    x.unliftio
  ]);

in pkgs.stdenv.mkDerivation {
  name = "async-test";

  src = ./.;

  buildInputs = [
    pkgs.makeWrapper
    ghc
  ];

  installPhase = ''
    mkdir -p $out/bin
    ghc -o async-test async-test.hs
    install -D -m555 -t $out/bin async-test
  '';
}
