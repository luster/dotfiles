#!/bin/sh
#
# Author: Ethan Lusterman
#
# install.sh
#   Install dotfiles and apps on Mac OS X
#
# Influenced by Christian Sherland via
#   https://github.com/csherland/dotfiles

# Change to home directory
cd

# Install Homebrew
if test ! $(which brew)
then
    echo "  Installing Hombrew..."
    ruby -e "$(curl -fsSL https://raw.githubusercontent.com/Homebrew/install/master/install)" >/tmp/homebrew-install.log
fi

############
### BREW ###
############
brew install caskroom/cask/brew-cask
brew install git
brew install htop
brew install macvim --override-system-vim
brew install tmux
brew install wget
brew install zsh
brew install zsh-completions
brew install v8

#echo "fpath=(/usr/local/share/zsh-completions/src $fpath)"
#rm -f ~/.zcompdump; compinit

##############################
### Mac Apps via brew cask ###
##############################
brew cask install audacity
brew cask install dropbox
brew cask install flux
brew cask install google-chrome
brew cask install iterm2
brew cask install skype
brew cask install spotify
brew cask install vagrant
brew cask install virtualbox
brew cask install vlc

# cool font, thanks Christian
brew tap caskroom/fonts
brew cask install font-inconsolata-dz-for-powerline

# some shell completions
brew tap homebrew/completions
brew install vagrant-completion
brew install django-completion
brew install pip-completion

# Install oh-my-zsh, set zsh as default shell
curl -L http://install.ohmyz.sh | sh
sudo chsh -s $(whoami) $(which zsh)
ln -s ~/.dotfiles/.zshrc ~/.zshrc

# vim
ln -s ~/.dotfiles/.vimrc ~/.vimrc

# tmux
ln -s ~/.dotfiles/.tmux.conf ~/.tmux.conf

# global gitignore/config
ln -s ~/.dotfiles/.gitignore ~/.gitignore
ln -s ~/.dotfiles/.gitconfig ~/.gitconfig
git config --global core.excludesfile '~/.gitignore'

# configure git user
git config --global user.name "Ethan"
git config --global user.email "ethan.lusterman@gmail.com"

# configure htop to display information properly
sudo chown root:wheel /usr/local/Cellar/htop-osx/0.8.2.7/bin/htop
sudo chmod u+s /usr/local/Cellar/htop-osx/0.8.2.7/bin/htop

exit 0
