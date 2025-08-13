deploy:
	nix build .#darwinConfigurations.timv-m1mini.system \
	   --extra-experimental-features 'nix-command flakes'

	sudo -E ./result/sw/bin/darwin-rebuild switch --flake .#timv-m1mini
