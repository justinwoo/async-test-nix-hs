compare

`runghc async-test.hs`

and

`nix-build; ./result/bin/async-test`

but nix-shell does the right thing:

`nix-shell -p "pkgs.ghc.withPackages(x:[x.unliftio])" --run 'runghc async-test.hs'`
