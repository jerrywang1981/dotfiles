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

PATH="$HOME/.cargo/bin:$HOME/.local/bin:$HOME/bin:$PATH"
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
. "$HOME/.cargo/env"
