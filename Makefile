# Personal .vim files Makefile
#
# Gets all vim plugins and places into appropriate
# folder and then creates symlink to .vimrc

all: plugins vimrc

plugins: general-plugins python-plugins cpp-plugins

general-plugins: nerdtree ctrlp tagbar supertab syntastic fugitive

python-plugins: flake8

cpp-plugins: omnicppcomplete

vimrc:
	ln -sf ~/.vim/.vimrc ~/.vimrc

nerdtree:
	cd ~/.vim/bundle
	git clone https://github.com/scrooloose/nerdtree.git

ctrlp:
	cd ~/.vim/bundle
	git clone https://github.com/ctrlpvim/ctrlp.vim.git

tagbar:
	cd ~/.vim/bundle
	git clone https://github.com/majutsushi/tagbar.git

supertab:
	cd ~/.vim/bundle
	git clone https://github.com/ervandew/supertab.git

syntastic:
	cd ~/.vim/bundle
	git clone https://github.com/scrooloose/syntastic.git

fugitive:
	cd ~/.vim/bundle
	git clone https://github.com/tpope/vim-fugitive.git

flake8:
	cd ~/.vim/bundle
	git clone https://github.com/nvie/vim-flake8.git

omnicppcomplete:
	curl -o omnicppcomplete-0.41.zip http://www.vim.org/scripts/download_script.php?src_id=7722
	unzip -o omnicppcomplete-0.41.zip -d ~/.vim
	rm omnicppcomplete-0.41.zip

clean:
	rm -rf ~/.vim/bundle
