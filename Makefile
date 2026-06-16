# TODO change tbnl-timvmacbook to your prefered hostname
deploy:
	nix build .#darwinConfigurations.TB50141.system \
	   --extra-experimental-features 'nix-command flakes'

	sudo -E ./result/sw/bin/darwin-rebuild switch --flake .#TB50141
