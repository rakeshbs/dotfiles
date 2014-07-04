set nocompatible              " be iMproved, required
filetype off                  " required
set number
set timeout
set timeoutlen=1000

set rnu
set nu

set shiftwidth=4
set tabstop=4
set expandtab

" set the runtime path to include Vundle and initialize
set rtp+=~/.vim/bundle/Vundle.vim
call vundle#begin()
" alternatively, pass a path where Vundle should install plugins
"call vundle#begin('~/some/path/here')

" let Vundle manage Vundle, required
Plugin 'gmarik/Vundle.vim'
Plugin 'https://github.com/scrooloose/syntastic'
Plugin 'https://github.com/bling/vim-airline'
Plugin 'https://github.com/kien/ctrlp.vim'
Plugin 'https://github.com/majutsushi/tagbar'
Plugin 'eagletmt/neco-ghc'
Plugin 'ervandew/supertab'
Plugin 'https://github.com/Valloric/YouCompleteMe'
Plugin 'lambdatoast/elm.vim'
Plugin 'toyamarinyon/vim-swift'
Plugin 'vim-scripts/CmdlineComplete'

" All of your Plugins must be added before the following line
call vundle#end()            " required
filetype plugin indent on    " required
" To ignore plugin indent changes, instead use:
"filetype plugin on
"
" Brief help
" :PluginList          - list configured plugins
" :PluginInstall(!)    - install (update) plugins
" :PluginSearch(!) foo - search (or refresh cache first) for foo
" :PluginClean(!)      - confirm (or auto-approve) removal of unused plugins
"
" see :h vundle for more details or wiki for FAQ
" Put your non-Plugin stuff after this line

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
nnoremap <Leader>p :CtrlP<CR>
nnoremap <Leader>t :TagbarToggle<CR>
nnoremap <Leader>n :call NumberToggle()<CR>
nnoremap <Leader>s :w<CR>

set pastetoggle=<f5>


autocmd BufWritePre * :%s/\s\+$//e
 augroup FastEscape
      autocmd!
      au InsertEnter * set timeoutlen=0
      au InsertLeave * set timeoutlen=1000
augroup END

autocmd InsertEnter * :set nu
autocmd InsertEnter * :set nornu
autocmd InsertLeave * :set rnu

nnoremap <Leader><Left> :tabprevious<CR>
nnoremap <Leader><Right> :tabnext<CR>
nnoremap <Leader><Up> :tabnew<CR>
nnoremap <Leader><Down> :tabclose<CR>

map <PageUp> <C-U>
map <PageDown> <C-D>
imap <PageUp> <C-O><C-U>
imap <PageDown> <C-O><C-D>
set nostartofline
