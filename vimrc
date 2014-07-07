set nocompatible              " be iMproved, required
filetype off                  " required
set number
set timeout
set timeoutlen=1000
set incsearch
set rnu
set nu
set hidden  " For LustyExplorer
set shiftwidth=4
set tabstop=4
set expandtab

set rtp+=~/CommandLineTools/.fzf

" set the runtime path to include Vundle and initialize
set rtp+=~/.vim/bundle/Vundle.vim
call vundle#begin()
" alternatively, pass a path where Vundle should install plugins
"call vundle#begin('~/some/path/here')

" let Vundle manage Vundle, required
Plugin 'gmarik/Vundle.vim'
Plugin 'https://github.com/scrooloose/syntastic'
Plugin 'https://github.com/bling/vim-airline'
Plugin 'https://github.com/majutsushi/tagbar'
Plugin 'eagletmt/neco-ghc'
Plugin 'ervandew/supertab'
Plugin 'https://github.com/Valloric/YouCompleteMe'
Plugin 'lambdatoast/elm.vim'
Plugin 'toyamarinyon/vim-swift'
Plugin 'vim-scripts/CmdlineComplete'
Plugin 'tpope/vim-fugitive.git'
Plugin 'vim-scripts/EasyGrep'
Plugin 'wincent/Command-T'
Plugin 'vim-scripts/YankRing.vim'

" All of your Plugins must be added before the following line
call vundle#end()            " required
filetype plugin indent on    " required

let g:syntastic_check_on_open=1
let g:syntastic_enable_signs=1

" You may already have the following two on, please check
syntax on
filetype plugin on

" This assumes that ghc is in your path, if it is not, or you
" wish to use a specific version of ghc, then please change
" the ghc below to a full path to the correct one
au BufEnter *.hs compiler ghc

" For this section both of these should be set to your
" browser and ghc of choice, I used the following
" two vim lines to get those paths:
" :r!which google-chrome
" :r!which ghc

let g:haddock_browser = "open"
let g:ghc = "/usr/local/bin/ghc"

"Airline
set t_Co=8
set laststatus=2
let g:airline_theme = 'bubblegum'
let g:airline_left_sep = ''
let g:airline_left_alt_sep = ''
let g:airline_right_sep = ''
let g:airline_right_alt_sep = ''

" Tagbar settings
let g:tagbar_autofocus=1
let g:tagbar_autoclose=1
" add a definition for Objective-C to tagbar
let g:tagbar_type_objc = {
    \ 'ctagstype' : 'ObjectiveC',
    \ 'kinds'     : [
        \ 'i:interface',
        \ 'I:implementation',
        \ 'p:Protocol',
        \ 'm:Object_method',
        \ 'c:Class_method',
        \ 'v:Global_variable',
        \ 'F:Object field',
        \ 'f:function',
        \ 'p:property',
        \ 't:type_alias',
        \ 's:type_structure',
        \ 'e:enumeration',
        \ 'M:preprocessor_macro',
    \ ],
    \ 'sro'        : ' ',
    \ 'kind2scope' : {
        \ 'i' : 'interface',
        \ 'I' : 'implementation',
        \ 'p' : 'Protocol',
        \ 's' : 'type_structure',
        \ 'e' : 'enumeration'
    \ },
    \ 'scope2kind' : {
        \ 'interface'      : 'i',
        \ 'implementation' : 'I',
        \ 'Protocol'       : 'p',
        \ 'type_structure' : 's',
        \ 'enumeration'    : 'e'
    \ }
\ }


" Keybindings
let mapleader = " "

nnoremap <Leader>l :Lexplore<CR>
nnoremap <Leader>t :TagbarToggle<CR>
nnoremap <Leader>w :w<CR>
nnoremap <Leader>vq :ccl<CR>
nnoremap <Leader>p :CommandT<CR>
nnoremap <Leader>b :CommandTBuffer<CR>
nnoremap <Leader><Left> :bp<CR>
nnoremap <Leader><Right> :bn<CR>
nnoremap <Leader><Down> :bd<CR>
nnoremap <Leader>y :YRShow<CR>


set pastetoggle=<f5>

" Hightlight Search toggle
let hlstate=0
nnoremap <f4> :if (hlstate%2 == 0) \| nohlsearch \| else \| set hlsearch \| endif \| let hlstate=hlstate+1<cr>

" Remove trailing spaces
autocmd BufWritePre * :%s/\s\+$//e

augroup FastEscape
      autocmd!
      au InsertEnter * set timeoutlen=0
      au InsertLeave * set timeoutlen=1000
augroup END

autocmd InsertEnter * :set nu
autocmd InsertEnter * :set nornu
autocmd InsertLeave * :set rnu


map <PageUp> <C-U>
map <PageDown> <C-D>
imap <PageUp> <C-O><C-U>
imap <PageDown> <C-O><C-D>
set nostartofline

highlight TabLineFill ctermfg=233 ctermbg=233
highlight TabLine ctermfg=244 ctermbg=233
highlight TabLineSel ctermfg=White ctermbg=233

"Search and replace vim
nnoremap <Leader>s :%s/\<<C-r><C-w>\>//g<Left><Left>

" EasyGrep
let g:EasyGrepFileAssociationsInExplorer = 1
let g:EasyGrepFileAssociations = $HOME+ '/.vim/EasyGrepFileAssociations'
let g:EasyGrepSearchCurrentBufferDir = 0
let g:EasyGrepFileAssociationsInExplorer = 1
let g:EasyGrepRecursive = 1
let g:EasyGrepEveryMatch = 1
let g:EasyGrepMode = 2

"Automatic Paste Mode
inoremap <C-v> <F5><C-r>+<F5>

"CommandT
let g:CommandTCancelMap     = ['<ESC>', '<C-c>']
let g:CommandTSelectNextMap = ['<C-n>', '<C-j>', '<ESC>OB']
let g:CommandTSelectPrevMap = ['<C-p>', '<C-k>', '<ESC>OA']
let g:CommandTMaxHeight=20
