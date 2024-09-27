{
  description = "A description about my executable";
  inputs = {
    nixpkgs.url = "github:NixOS/nixpkgs/nixpkgs-unstable";
    flake-utils = {
      url = "github:numtide/flake-utils";
      inputs.nixpkgs.follows = "nixpkgs";
    };
  };
  
  outputs = inputs:
    let
      overlay = final: prev: {
        haskell = prev.haskell // {
          packageOverrides = hfinal: hprev:
            prev.haskell.packageOverrides hfinal hprev // {
              TheNameOfMyExecutable = hfinal.callCabal2nix "TheNameOfMyExecutable" ./. { };
            };
          };
               OnCallComp = final.haskell.lib.compose.justStaticExecutables final.haskellPackages.TheNameOfMyExecutable;
  };
  perSystem = system:
    let
      pkgs = import inputs.nixpkgs { inherit system; overlays = [ overlay ]; config = { allowUnfree = true; };};
    in
    {
       devShell = pkgs.haskellPackages.shellFor {
         withHoogle = true;
         packages = p: [ p.OnCallComp];
  
         nativeBuildInputs = with pkgs.haskellPackages; [
           cabal-install
#          haskell-language-server
           hlint
           ormolu
           ghcid
 #             pkgs.bashInteractive
 #             pkgs.zlib
 #             (pkgs.vscode-with-extensions.override {
 #             vscode = pkgs.vscodium;
 #             vscodeExtensions = with pkgs.vscode-extensions; [
 #                  asvetliakov.vscode-neovim
 #                  dracula-theme.theme-dracula
 #                  haskell.haskell
 #                  jnoortheen.nix-ide
 #                  justusadam.language-haskell

 #                  mkhl.direnv
 #              ];  
 #             }
         ]; 
   };
   defaultPackage = pkgs.TheNameOfMyExecutable;
 };
 in
   { inherit overlay; } // inputs.flake-utils.lib.eachSystem [ "x86_64-linux" ] perSystem;
  
}

