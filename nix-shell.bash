nix-shell -p "pkgs.ghc.withPackages(x:[x.unliftio])" --run 'runghc async-test.hs'
