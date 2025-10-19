
# Installation


```shell
# first clone this repo into the directory where your repos live
# in my case this is `~/code`
pushd ~/
git clone git@github.com:daniel-baez/dotfiles.git ~/code/dotfiles
popd

# later add this line in your ~/.bashrc or ~/.zshrc
source "$HOME/code/dotfiles/home/daplay/.bashrc"


ln -s ~/code/dotfiles/.spacemacs ~/.spacemacs
```
