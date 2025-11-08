FROM alpine

LABEL author="Jerry Wang <jerrywang1981@outlook.com>"
LABEL version="quay.io/jerrywang1981/vim:0.0.2"

ARG USERNAME=vscode

# RUN sed -i 's/dl-cdn.alpinelinux.org/mirrors.ustc.edu.cn/g' /etc/apk/repositories
RUN apk fix && \
    apk --no-cache --update add git git-lfs gpg less sudo \
    openssh patch perl curl ripgrep fzf bash bash-completion vim tmux \
    python3 nodejs openjdk21-jdk maven && \
    git lfs install


RUN addgroup -g 1000 $USERNAME && adduser -u 1000 -G $USERNAME -s /bin/bash --disabled-password $USERNAME && \
    echo $USERNAME:$USERNAME | chpasswd

RUN echo $USERNAME ALL=\(root\) NOPASSWD:ALL > /etc/sudoers.d/$USERNAME && chmod 0440 /etc/sudoers.d/$USERNAME

RUN su $USERNAME -c "git clone --filter=blob:none --depth=1 https://github.com/jerrywang1981/vim.git ~/.vim"
RUN su $USERNAME -c "curl -fLo ~/.vim/autoload/plug.vim --create-dirs  https://raw.githubusercontent.com/junegunn/vim-plug/master/plug.vim"
RUN su $USERNAME -c "curl -fLo ~/.bashrc https://raw.githubusercontent.com/jerrywang1981/dotfiles/refs/heads/master/docker/vim/.bashrc"
RUN su $USERNAME -c "curl -fLo ~/.bash_profile https://raw.githubusercontent.com/jerrywang1981/dotfiles/refs/heads/master/docker/vim/.bash_profile"
RUN su $USERNAME -c "curl -fLo ~/.tmux.conf https://raw.githubusercontent.com/jerrywang1981/dotfiles/refs/heads/master/tmux/.tmux.conf"
RUN su $USERNAME -c "curl -fLo ~/.editorconfig https://raw.githubusercontent.com/jerrywang1981/dotfiles/refs/heads/master/code/.editorconfig"
# RUN su $USERNAME -c 'vim -es -u ~/.vim/vimrc -i NONE -c "PlugInstall" -c "qa"'


VOLUME /workspaces

USER $USERNAME

WORKDIR /home/$USERNAME
ADD ./plugged.tar .vim

CMD ["/bin/bash"]
