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
                            python3-pip

RUN dnf clean all
