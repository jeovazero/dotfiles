NVIM_DIR=$(HOME)/.config/nvim

apply-nvim:
	cp -r -t $(NVIM_DIR) ./nvim/*
