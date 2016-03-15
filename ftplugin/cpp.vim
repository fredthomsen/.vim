""""""""""
"key bindings
""""""""""

"regenerate tags
map <F5> :!ctags -R --c++-kinds=+p --fields=+ialS --extra=+q .<CR>
"switch between header and source
map <F6> :e %:p:s,.h$,.X123X,:s,.cpp$,.h,:s,.X123X$,.cpp,<CR>
"make
map <F7> :make<CR>
"clean
map <S-F7> :make clean all<CR>

"""""""""
"plugins
"""""""""

""omnicppcomplete
set tags+=~/.vim/tags/cpp

let OmniCpp_NamespaceSearch = 1
let OmniCpp_GlobalScopeSearch = 1
let OmniCpp_ShowAccess = 1
let OmniCpp_ShowPrototypeInAbbr = 1 " show function parameters
let OmniCpp_MayCompleteDot = 1 " autocomplete after .
let OmniCpp_MayCompleteArrow = 1 " autocomplete after ->
let OmniCpp_MayCompleteScope = 1 " autocomplete after ::
let OmniCpp_DefaultNamespaces = ["std", "_GLIBCXX_STD"]
"automatically open and close the popup menu / preview window
au CursorMovedI,InsertLeave * if pumvisible() == 0|silent! pclose|endif
set completeopt=menuone,menu,longest,preview
