TO_NVIM=$(HOME)/.config/nvim
TO_STARSHIP=$(HOME)/.config/starship.toml

apply-nvim:
	cp -r -t $(TO_NVIM) ./nvim/*

apply-starship:
	cp ./starship/starship.toml $(TO_STARSHIP)
