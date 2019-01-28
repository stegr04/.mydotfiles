#ln -sf $(dirname $0)/.vimrc ~/.vimrc
#ln -sf $(dirname $0)/.vim ~/.vim
echo $(dirname $0)
export MYVIMRC=$(dirname $0)/.vimrc
#ln -s $(dirname $0)/.vimrc ~/.gvimrc
