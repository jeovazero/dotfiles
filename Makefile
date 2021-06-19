TO_NVIM=$(HOME)/.config/nvim
TO_STARSHIP=$(HOME)/.config/starship.toml
TO_FONTS=$(HOME)/.local/share/fonts

apply-nvim:
	cp -r -t $(TO_NVIM) ./nvim/*

apply-starship:
	cp ./starship/starship.toml $(TO_STARSHIP)

apply-font:
	mkdir $(TO_FONTS)/JetBrainsMono
	unzip fonts/JetBrainsMono.zip -d $(TO_FONTS)/JetBrainsMono
	fc-cache -f -v
