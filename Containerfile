ARG RELEASE=44
FROM registry.fedoraproject.org/fedora-toolbox:$RELEASE

RUN dnf config-manager setopt fedora-cisco-openh264.enabled=1

RUN dnf --assumeyes install \
    https://mirrors.rpmfusion.org/free/fedora/rpmfusion-free-release-$(rpm -E %fedora).noarch.rpm \
    https://mirrors.rpmfusion.org/nonfree/fedora/rpmfusion-nonfree-release-$(rpm -E %fedora).noarch.rpm

RUN dnf --assumeyes install neovim \
                            cargo \
                            golang-bin \
                            git \
                            kitty-terminfo \
                            fd-find \
                            ripgrep \
                            git-delta \
                            python3-pip

RUN dnf clean all

RUN curl -kL  https://github.com/jesseduffield/lazygit/releases/download/v0.66.1/lazygit_0.66.1_linux_x86_64.tar.gz | tar -xf - -C /usr/local/bin lazygit
RUN curl -kL https://github.com/google/yamlfmt/releases/download/v0.21.0/yamlfmt_0.21.0_Linux_x86_64.tar.gz | tar -xzf - -C /usr/local/bin/ yamlfmt
