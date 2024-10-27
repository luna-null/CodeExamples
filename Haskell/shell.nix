{ pkgs ? import <nixpkgs> {} }:

pkgs.mkShell {
  buildInputs = with pkgs; [
    (haskellPackages.ghcWithPackages (p: [
      p.pretty-simple
      p.random
    ]))
    ghc
  ];
}
