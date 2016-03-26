#!/bin/bash

cd ~/.vim/bundle
git clone https://github.com/scrooloose/nerdtree.git
git clone https://github.com/ervandew/supertab.git
git clone https://github.com/tpope/vim-fugitive.git
git clone https://github.com/ctrlpvim/ctrlp.vim.git
git clone https://github.com/majutsushi/tagbar.git
git clone https://github.com/scrooloose/syntastic.git
curl -o omnicppcomplete-0.41.zip http://www.vim.org/scripts/download_script.php?src_id=7722; unzip omnicppcomplete-0.41.zip ~/.vim
