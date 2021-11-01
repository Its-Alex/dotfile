#!/bin/sh

echo "====> Configure os..."

echo "==> Install Git"
sudo pacman -S git base-devel
cp ../files/.gitconfig "${HOME}/.gitconfig"
echo "==> Install Yay"
git clone https://aur.archlinux.org/yay.git /tmp/yay
(
    cd /tmp/yay || exit 1
    makepkg -si
)
rm -rf /tmp/yay

echo "==> Keyboard..."
yay -S xkb-qwerty-fr --noconfirm --needed

echo "===> Install needed programs..."

echo "==> Vim..."
sudo pacman -S vim --noconfirm --needed
echo "==> Fonts..."
yay -S monaco-powerline-font-git otf-font-awesome noto-fonts noto-fonts-emoji noto-fonts-extra ttf-material-design-icons ttf-unifont ttf-droid ttf-fira-code --noconfirm --needed
echo "==> Visual studio code..."
# yay -S visual-studio-code-bin --noconfirm --needed
code --user-data-dir "${HOME}" --install-extension Shan.code-settings-sync
echo "==> alacritty..."
yay -S alacritty tmux tmuxinator --noconfirm --needed
mkdir -p "${HOME}/.tmux/plugins"
git clone https://github.com/tmux-plugins/tpm "${HOME}/.tmux/plugins/tpm"
echo "==> Keyrings..."
yay -S gnome-keyring --noconfirm --needed
echo "==> Docker..."
yay -S docker docker-compose --noconfirm --needed
sudo usermod -aG docker "${USER}"
systemctl enable docker
echo "==> Virtualbox..."
yay -S virtualbox virtualbox-host-dkms linux-headers --noconfirm --needed
echo "==> Vagrant..."
yay -S vagrant --noconfirm --needed

echo "==> Grub update..."
sudo grub-mkconfig -o /boot/grub/grub.cfg

yay -S zsh --noconfirm --needed
sh -c "$(curl -fsSL https://raw.github.com/ohmyzsh/ohmyzsh/master/tools/install.sh)"

echo "===> Install customs programs..."

yay -S --noconfirm --needed \
    numix-cursor-theme \
    numix-frost-themes \
    numix-square-icon-theme \
    htop \
    unzip \
    tar \
    tfenv \
    pgcli \
    direnv \
    vlc \
    authy \
    spotify \
    slack-desktop \
    simplenote-electron-bin

# Nvidia

# yay -S --noconfirm --needed \
#     nvidia \
#     nvidia-dkms \
#     nvidia-settings \
#     nvidia-utils
