# .bash_profile

# Get the aliases and functions
if [ -f ~/.bashrc ]; then
	. ~/.bashrc
fi

# User specific environment and startup programs
GRS_PKCS11_DISABLE_EC=1;
export GRS_PKCS11_DISABLE_EC
GRS_PKCS11_DISABLE_EC=1;
export GRS_PKCS11_DISABLE_EC
GRS_PKCS11_DISABLE_EC=1;
export GRS_PKCS11_DISABLE_EC
GRS_PKCS11_DISABLE_EC=1;
export GRS_PKCS11_DISABLE_EC

if [ -f ~/.cargo/env ]; then
	. ~/.cargo/env
fi

export PATH=$PATH:$HOME/go/bin
#. "$HOME/.cargo/env"
