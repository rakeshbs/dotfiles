set nocompatible              " be iMproved, required
filetype off                  " required
set number
set timeout
set timeoutlen=1000
set incsearch
set rnu
" set hidden  " For LustyExplorer
set shiftwidth=2
set tabstop=2
set softtabstop=2
set expandtab
set cursorline
set background=dark
syntax on

" set the runtime path to include Vundle and initialize
set rtp+=~/.vim/bundle/Vundle.vim
set runtimepath+=~/.vim/bundle/ultisnips

call vundle#begin()
" alternatively, pass a path where Vundle should install plugins
"call vundle#begin('~/some/path/here')

" let Vundle manage Vundle, required
Plugin 'gmarik/Vundle.vim'
Plugin 'ervandew/supertab'
Plugin 'https://github.com/scrooloose/syntastic'
Plugin 'https://github.com/bling/vim-airline'
Plugin 'https://github.com/majutsushi/tagbar'
Plugin 'eagletmt/neco-ghc'
Plugin 'lambdatoast/elm.vim'
Plugin 'toyamarinyon/vim-swift'
Plugin 'vim-scripts/CmdlineComplete'
Plugin 'tpope/vim-fugitive.git'
Plugin 'vim-scripts/EasyGrep'
Plugin 'wincent/Command-T'
Plugin 'vim-scripts/YankRing.vim'
Plugin 'vim-ruby/vim-ruby'
Plugin 't9md/vim-ruby-xmpfilter'
Plugin 'tpope/vim-rvm'
Plugin 'xolox/vim-misc'
Plugin 'tpope/vim-surround'
Plugin 'xolox/vim-easytags'
Plugin 'tpope/vim-endwise'

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

set nocompatible

if has("syntax")
  syntax on
endif

if has("autocmd")
 filetype plugin indent on
endif


let g:rubycomplete_buffer_loading = 1
let g:rubycomplete_classes_in_global = 1

command W execute ":w"
command Q execute ":q"
command WQ execute ":wq"
command Wq execute ":wq"

"Airline
set t_Co=256
set laststatus=2
let g:airline_theme = 'bubblegum'
let g:airline_left_sep = ''
let g:airline_left_alt_sep = ''
let g:airline_right_sep = ''
let g:airline_right_alt_sep = ''

" Tagbar settings
" let g:tagbar_autofocus=1
" let g:tagbar_autoclose=1
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

inoremap <F10> <Esc><Esc>/<%[^>]*><CR>v//e<CR><C-g>
snoremap <F10> <Esc><Esc>/<%[^>]*><CR>v//e<CR><C-g>
nnoremap <F10> <Esc><Esc>/<%[^>]*><CR>v//e<CR><C-g>
xnoremap <F10> <Esc><Esc>
cnoremap <F10> <Esc><Esc>
onoremap <F10> <Esc><Esc>

nnoremap <C-J> mao<Esc>`a
nnoremap <C-K> maO<Esc>`a
inoremap <C-J> <Esc>mao<Esc>`ai
inoremap <C-K> <Esc>maO<Esc>`ai

nnoremap <Leader>l :Lexplore<CR>
nnoremap <Leader>t :TagbarToggle<CR>
nnoremap <Leader>w :w<CR>
nnoremap <Leader>vq :ccl<CR>
nnoremap <Leader>p :CommandT<CR>
nnoremap <Leader>b :CommandTBuffer<CR>
nnoremap <Leader><Left> <C-w><Left>
nnoremap <Leader><Right> <C-w><Right>
nnoremap <Leader><Up> <C-w><Up>
nnoremap <Leader><Down> <C-w><Down>
nnoremap <Leader>y :YRShow<CR>
nnoremap <Leader>= mzgg=G`z

nnoremap <c-a> ggVG

set pastetoggle=<f5>

" Automatic normal mode
" set 'updatetime' to 15 seconds when in insert mode
au InsertEnter * let updaterestore = &updatetime | set updatetime=5000
au InsertLeave * let &updatetime = updaterestore
"
" " automatically leave insert mode after 'updatetime' milliseconds of
" inaction
au CursorHoldI * stopinsert

" Remember Last position
if has("autocmd")
  au BufReadPost * if line("'\"") > 1 && line("'\"") <= line("$") | exe "normal! g'\"" | endif
endif


" Hightlight Search toggle
let hlstate=0
nnoremap <f4> :if (hlstate%2 == 0) \| nohlsearch \| else \| set hlsearch \| endif \| let hlstate=hlstate+1<cr>

" Remove trailing spaces
autocmd BufWritePre * :%s/\s\+$//e

" FastEscape from insert mode
augroup FastEscape
      autocmd!
      au InsertEnter * set timeoutlen=0
      au InsertLeave * set timeoutlen=1000
augroup END

autocmd InsertEnter * :set nu
autocmd InsertEnter * :set nornu
" autocmd InsertLeave * :set nonu
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
nnoremap <Leader>s :call SearchAndReplace("<C-r><C-w>","")<Left><Left>

function! SearchAndReplace(search_string,replace_string)
  execute "normal! mz"
  execute "silent %s/" . a:search_string . "/".a:replace_string."/g"
  execute "normal! `z"
endfunction

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

nnoremap <F8> :SemanticHighlightToggle<cr>

"CommandT
let g:CommandTCancelMap     = ['<ESC>', '<C-c>', '<F10>']
let g:CommandTSelectNextMap = ['<C-n>', '<C-j>', '<ESC>OB']
let g:CommandTSelectPrevMap = ['<C-p>', '<C-k>', '<ESC>OA']
let g:CommandTMaxHeight=20

"Commenting
let s:comment_map = {
    \   "c": '// ',
    \   "cpp": '// ',
    \   "go": '// ',
    \   "java": '// ',
    \   "javascript": '// ',
    \   "php": '// ',
    \   "python": '# ',
    \   "ruby": '# ',
    \   "vim": '" ',
    \ }

function! ToggleComment()
    if has_key(s:comment_map, &filetype)
        let comment_leader = s:comment_map[&filetype]
        if getline('.') =~ "^" . comment_leader
            " Uncomment the line
            execute "silent s/^" . comment_leader . "//"
        else
            " Comment the line
            execute "silent s/^/" . comment_leader . "/"
        endif
    else
        echo "No comment leader found for filetype"
    end
endfunction

nnoremap <leader>/ :call ToggleComment()<cr>
vnoremap <leader>/ :call ToggleComment()<cr>

highlight Normal ctermbg=234

"Toggle ScrollOff
nnoremap <Leader>zz :let &scrolloff=999-&scrolloff<CR>


"Syntastic Colours
let g:syntastic_enable_highlighting = 0
colorscheme Tomorrow-Night

" Autocomplete Menu
highlight PmenuSel ctermfg=247 ctermbg=234
highlight Pmenu ctermbg=234 ctermfg=247

"CursorLine Colors
highlight CursorLine ctermbg=235

"Visual Selection
highlight Visual ctermbg=236

let g:SuperTabDefaultCompletionType = 'context'
let g:rubymotion_completion_enabled = 0

let is_inside_rubymotion_folder = matchstr(getcwd(),"\/RubyMotion\/")
if empty(is_inside_rubymotion_folder)
else
  let g:SuperTabDefaultCompletionType = '<c-x><c-o>'
  let g:rubymotion_completion_enabled = 1
endif

let is_inside_ruby_folder = matchstr(getcwd(),"\/Ruby\/")
if empty(is_inside_ruby_folder)
else
  let g:SuperTabDefaultCompletionType = '<c-x><c-o>'
endif
"
"Easy Tags
let is_inside_projects_folder = matchstr(getcwd(),"\/Projects\/")
if empty(is_inside_projects_folder)
else
  set tags=tags
  let g:easytags_cmd = '/usr/local/bin/ctags'
  let g:easytags_dynamic_files = 2
endif

if executable('ripper-tags')
  let g:easytags_languages = {'ruby': {'cmd': 'ripper-tags'}}
endif

set completeopt=longest,menuone,preview
set splitbelow
" let g:SuperTabClosePreviewOnPopupClose = 1

