#!/bin/sh
#
# Author: Ethan Lusterman
# Created: 10/20/14
# Modified: 10/23/14
#
# install.sh
#   Install dotfiles and apps on Mac OS X
#
# Influenced by Christian Sherland via
#   https://github.com/csherland/dotfiles/install.sh

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
brew install wget
brew install zsh
brew install zsh-completions
brew install v8

echo "fpath=(/usr/local/share/zsh-completions/src $fpath)"
rm -f ~/.zcompdump; compinit

##############################
### Mac Apps via brew cask ###
##############################
brew cask install adium
brew cask install atom
brew cask install audacity
brew cask install desmume
brew cask install dropbox
brew cask install google-drive
brew cask install flux
brew cask install google-chrome
brew cask install handbrake
brew cask install iterm2
brew cask install skype
brew cask install soundflower
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
rm ~/.zshrc
# ln -s ~/.dotfiles/zshrc ~/.zshrc TODO: add zshrc
# source ~/.zshrc

# vim TODO: add vimrc in right place, reconfigure
# mkdir ~/.vim
# ln -s ~/.dotfiles/vimrc ~/.vim/vimrc
# ln -s ~/.vim/vimrc ~/.vimrc

# vim setup
# vim +PluginInstall +qall
# cd ~/.vim/bundle/YouCompleteMe
# ./install.sh --clang-completer
# cd

# iterm preferences TODO: add iterm2 prefs file
# defaults write com.googlecode.iterm2 PrefsCustomFolder "/Users/$(whoami)/.dotfiles/"

# global gitignore TODO: get OS X and Linux global gitignore file
# ln -s ~/.dotfiles/gitignore_global ~/.gitignore_global
# git config --global core.excludesfile '~/.gitignore_global'

# configure git user
git config --global user.name "Ethan"
git config --global user.email "ethan.lusterman@gmail.com"

# configure htop to display information properly
sudo chown root:wheel /usr/local/Cellar/htop-osx/0.8.2.2/bin/htop
sudo chmod u+s /usr/local/Cellar/htop-osx/0.8.2.2/bin/htop

exit 0
