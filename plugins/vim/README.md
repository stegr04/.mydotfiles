# vim

This is a set of vim configuration files that I put together while learning how to create my own key mappings to add colored echo and read commands. 
To use it I need to clone the repository, delete any existing .vimrc file and .vim folder. Then run these commands to create a symlink:
ln -s ./vim/.vimrc ~/.vimrc
ln -s ./vim/.vim ~/.vim

Notable VIM Configuration Information:
- Originally used: bash-support vim plugin: https://github.com/vim-scripts/bash-support.vim
- Updated to use bash-support plugin after: https://github.com/WolfgangMehner/vim-plugins/tree/master/bash-support
  - Another notable URL: https://github.com/WolfgangMehner/vim-plugins
  - Downloaded .zip file of repo from here: https://github.com/WolfgangMehner/bash-support
  - unzip ~/Downloads/bash-support-master
  - mv ~/Downloads/bash-support-master/* ~/vim/.vim/
  - cp ~/vim/.vim/bash-support/rc/personal.templates ~/vim/.vim/templates
  - cd ~/vim/.vim
  - On MAC: when opening vi it adds some characters. This was due to the ln -s ./vim/.vimrc ~/.vimrc. Deleted ~/.vimrc and works.
- Created my own supporting bash scripting shortcuts via bundle/gjs-bash
- default colorscheme = NuColors
- Using pathogen (plugin manager): https://github.com/tpope/vim-pathogen
- The shortcut "jk" ends Insert mode, not the esc key. 
- QQ can be used instead of q!
- ,ev will open the .vimrc
- ,sv will source the .vimrc
