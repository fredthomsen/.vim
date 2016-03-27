# Personal .vim files Makefile
#
# Gets all vim plugins and places into appropriate
# folder and then creates symlink to .vimrc
# TODO: Change to use submodules if possible

all: plugins vimrc

plugins: general-plugins python-plugins cpp-plugins

general-plugins: nerdtree ctrlp tagbar supertab syntastic fugitive

python-plugins: flake8

cpp-plugins: omnicppcomplete

vimrc:
	ln -sf ~/.vim/.vimrc ~/.vimrc

nerdtree:
	git clone https://github.com/scrooloose/nerdtree.git ~/.vim/bundle/nerdtree

ctrlp:
	git clone https://github.com/ctrlpvim/ctrlp.vim.git ~/.vim/bundle/ctrlp.vim

tagbar:
	git clone https://github.com/majutsushi/tagbar.git ~/.vim/bundle/tagbar

supertab:
	git clone https://github.com/ervandew/supertab.git ~/.vim/bundle/supertab

syntastic:
	git clone https://github.com/scrooloose/syntastic.git ~/.vim/bundle/syntastic

fugitive:
	git clone https://github.com/tpope/vim-fugitive.git ~/.vim/bundle/vim-fugitive

flake8:
	git clone https://github.com/nvie/vim-flake8.git ~/.vim/bundle/vim-flake8

omnicppcomplete:
	curl -o omnicppcomplete-0.41.zip http://www.vim.org/scripts/download_script.php?src_id=7722
	unzip -o omnicppcomplete-0.41.zip -d ~/.vim
	rm omnicppcomplete-0.41.zip

clean:
	rm -rf ~/.vim/bundle
