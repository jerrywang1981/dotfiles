# .bashrc

# Source global definitions
if [ -f /etc/bashrc ]; then
	. /etc/bashrc
fi

# User specific environment
# if ! [[ "$PATH" =~ "$HOME/.local/bin:$HOME/bin:" ]]
# then
    # PATH="$HOME/.local/bin:$HOME/bin:$PATH"
# fi

PATH="$HOME/.local/share/bob/nvim-bin:$HOME/.cargo/bin:$HOME/.local/bin:$HOME/bin:$PATH"
export PATH

# export JDTLS_HOME=~/.local/share/nvim/lsp_servers/jdtls

# Uncomment the following line if you don't like systemctl's auto-paging feature:
# export SYSTEMD_PAGER=

# User specific aliases and functions

[ -f ~/.fzf.bash ] && source ~/.fzf.bash
GRS_PKCS11_DISABLE_EC=1;
export GRS_PKCS11_DISABLE_EC
GRS_PKCS11_DISABLE_EC=1;
export GRS_PKCS11_DISABLE_EC
GRS_PKCS11_DISABLE_EC=1;
export GRS_PKCS11_DISABLE_EC
GRS_PKCS11_DISABLE_EC=1;
export GRS_PKCS11_DISABLE_EC
#. "$HOME/.cargo/env"

if [ -f ~/.cargo/env ]; then
        . ~/.cargo/env
fi

# Set up fzf key bindings and fuzzy completion
eval "$(fzf --bash)"

#THIS MUST BE AT THE END OF THE FILE FOR SDKMAN TO WORK!!!
export SDKMAN_DIR="$HOME/.sdkman"
[[ -s "$HOME/.sdkman/bin/sdkman-init.sh" ]] && source "$HOME/.sdkman/bin/sdkman-init.sh"

export NVM_DIR="$HOME/.nvm"
[ -s "$NVM_DIR/nvm.sh" ] && \. "$NVM_DIR/nvm.sh"  # This loads nvm
[ -s "$NVM_DIR/bash_completion" ] && \. "$NVM_DIR/bash_completion"  # This loads nvm bash_completion
