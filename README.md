### The idea in simple terms

to have all my programs customized wherever I go :)

#### add the following lines to your ~/.vimrc
```.vimrc
source ~/workspace/dotfiles/vim/plugins.vim
source ~/workspace/dotfiles/vim/main.vim
source ~/workspace/dotfiles/vim/wikis.vim
```

#### NeoVim

```.neovim
mkdir -p ~/.config/nvim/
ln -s ~/.vimrc ~/.config/nvim/init.vim
```

#### configure tmux by creating this link
```.tmux.conf
ln -s ~/workspace/dotfiles/tmux/tmux.conf ~/.tmux.conf
```

#### configure tmuxinator by creating this link
```.tmuxinator
ln -s ~/workspace/dotfiles/tmux/tmuxinator ~/.tmuxinator
```
