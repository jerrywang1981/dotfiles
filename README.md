# dotfiles

### required packages

* git
* stow
* tmux
* neovim
* zip/unzip
* luarocks

## Shell

### oh my zh
https://ohmyz.sh/
```
sh -c "$(curl -fsSL https://raw.github.com/ohmyzsh/ohmyzsh/master/tools/install.sh)"
sh -c "$(curl -fsSL https://raw.githubusercontent.com/ohmyzsh/ohmyzsh/master/tools/install.sh)"
git clone https://github.com/zsh-users/zsh-syntax-highlighting.git ${ZSH_CUSTOM:-~/.oh-my-zsh/custom}/plugins/zsh-syntax-highlighting
git clone https://github.com/zsh-users/zsh-autosuggestions ${ZSH_CUSTOM:-~/.oh-my-zsh/custom}/plugins/zsh-autosuggestions
git clone --depth=1 https://github.com/romkatv/powerlevel10k.git ${ZSH_CUSTOM:-$HOME/.oh-my-zsh/custom}/themes/powerlevel10k
```

### Tmux TPM (https://github.com/tmux-plugins/tpm)
```
git clone https://github.com/tmux-plugins/tpm ~/.tmux/plugins/tpm

```

### SDKMan (https://sdkman.io/)

```
curl -s "https://get.sdkman.io" | bash
```

### Node Version Manager (https://github.com/nvm-sh/nvm)
```
curl -o- https://raw.githubusercontent.com/nvm-sh/nvm/v0.40.1/install.sh | bash
```

### Rustup (Rust)
```
curl --proto '=https' --tlsv1.2 -sSf https://sh.rustup.rs | sh
```

### Ripgrep

```
cargo install ripgrep
```

### Glow

```
go install github.com/charmbracelet/glow@latest
```

### Delve
```
https://github.com/go-delve/delve/tree/master/Documentation/installation
```

### other
```
apt install luarocks
apt install python3-pynvim
cargo install viu
apt install chafa
apt install fd-find
npm install -g neovim
```


# Download the CLI
curl -LO https://mirror.openshift.com/pub/openshift-v4/clients/oc/latest/linux/oc.tar.gz

# Extract the tar file
tar -xvf oc.tar.gz

# Move the oc binary to a directory in your PATH
sudo mv oc /usr/local/bin/

#Helm
https://github.com/helm/helm/releases


### Wubi 98
https://wubi98.gitee.io/2021/11/08/2021-11-08-039.fcitx5/
http://98wb.ys168.com/
