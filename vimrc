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

call plug#begin('~/.vim/plugged')

Plug 'https://github.com/rakeshbs/vim-autocomplpop'
Plug 'https://github.com/fatih/vim-go', {'for' : 'go' }
Plug 'https://github.com/rakeshbs/vim-ruby', { 'for' : 'ruby'}
Plug 'vim-scripts/L9'
Plug 'scrooloose/syntastic'
Plug 'scrooloose/nerdcommenter'
Plug 'scrooloose/nerdtree'
Plug 'bling/vim-airline'
Plug 'majutsushi/tagbar'
Plug 'vim-scripts/CmdlineComplete'
Plug 'tpope/vim-fugitive'
Plug 'tpope/vim-surround'
Plug 'tpope/vim-endwise'
Plug 'xolox/vim-misc'
Plug 'xolox/vim-easytags'
Plug 'vim-scripts/EasyGrep'
Plug 'wincent/Command-T', { 'do': 'ruby command-t/ruby/command-t/extconf.rb' }
Plug 'Shougo/vimproc.vim', { 'do': 'make -f make_mac.mak' }
Plug 'vim-scripts/YankRing.vim'
Plug 'Rip-Rip/clang_complete'
Plug 't9md/vim-ruby-xmpfilter', { 'for': 'ruby' }
Plug 'lukerandall/haskellmode-vim', { 'for': 'haskell' }
Plug 'eagletmt/ghcmod-vim', { 'for': 'haskell' }
Plug 'eagletmt/neco-ghc', { 'for': 'haskell' }
Plug 'raichoo/haskell-vim', { 'for': 'haskell' }
Plug 'sudar/vim-arduino-syntax', { 'for': 'arduino' }


" All of your Plugins must be added before the following line
call plug#end()

filetype plugin indent on    " required

let g:syntastic_check_on_open=1
let g:syntastic_enable_signs=1

" You may already have the following two on, please check
syntax on
filetype plugin on


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

" Keybindings
let mapleader = " "

imap <F10> <tab>
smap <F10> <tab>
nmap <F10> <tab>
xmap <F10> <tab>

nnoremap <C-J> mao<Esc>`a
nnoremap <C-K> maO<Esc>`a
inoremap <C-J> <Esc>mao<Esc>`ai
inoremap <C-K> <Esc>maO<Esc>`ai

nnoremap <Leader>l :NERDTreeToggle<CR>
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

"Conditional Tab

inoremap <tab> <c-r>=ConditionalTab()<CR>
snoremap <tab> <Esc><Esc><Right>/<%[^>]*><CR>v//e<CR><C-g>
"inoremap <CR> A

function! ConditionalTab()
  if pumvisible()
    return "\<Down>"
  endif
  let line = getline('.')
  let substr = strpart(line, -1, col('.'))
  let substr = matchstr(substr, "[^ \t]*$")
  if (strlen(substr) == 0)
    return "\<tab>"
  endif
  let [row,col] = searchpos("\<%[^>]*>")
  if row == 0
    return "\<Esc>A"
  endif
  return  "\<Esc>\<Esc>/\<%[^>]*>\<CR>v//e\<CR>\<C-g>"
endfunction

function! MoveToAutocompleteMarker()
  let [row,col] = searchpos("\<%[^>]*>")
  if row == 0
    return
  endif
  call  feedkeys("\<Esc>\<Esc>/\<%[^>]*>\<CR>v//e\<CR>\<C-g>")
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

nnoremap <leader>/ :call NERDComment(0,"toggle")<cr>
vnoremap <leader>/ :call NERDComment(0,"toggle")<cr>

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

let g:rubymotion_completion_enabled = 0

autocmd FileType ruby :autocmd CompleteDone * :call MoveToAutocompleteMarker()

let is_inside_rubymotion_folder = matchstr(getcwd(),"\/RubyMotion\/")
if empty(is_inside_rubymotion_folder)
else
  let g:rubymotion_completion_enabled = 1
  autocmd CompleteDone * :call MoveToAutocompleteMarker()
endif

"
"Easy Tags
let is_inside_projects_folder = matchstr(getcwd(),"\/Projects\/")
if empty(is_inside_projects_folder)
else
  set tags=tags;
  let g:easytags_cmd = '/usr/local/bin/ctags'
  let g:easytags_dynamic_files = 2
endif

if executable('ripper-tags')
  let g:easytags_languages = {'ruby': {'cmd': 'ripper-tags'}}
endif

set completeopt=longest,menuone
set splitbelow

" Clang complete
let g:clang_library_path='/Applications/Xcode.app/Contents/Developer/Toolchains/XcodeDefault.xctoolchain/usr/lib'

" Haskell Settings
let g:haddock_browser = "open"
let g:ghc = "/usr/local/bin/ghc"
let g:hadock_indexfiledir="~/.vim/"

" Tagbar settings
let g:tagbar_autofocus = 1
"let g:tagbar_autoclose = 1

" Ruby XMPFilter Settings
autocmd FileType ruby nmap <buffer> <leader>m <Plug>(xmpfilter-mark)
autocmd FileType ruby xmap <buffer> <leader>m <Plug>(xmpfilter-mark)
autocmd FileType ruby imap <buffer> <leader>m <Plug>(xmpfilter-mark)

autocmd FileType ruby nmap <buffer> <leader>r <Plug>(xmpfilter-run)
autocmd FileType ruby xmap <buffer> <leader>r <Plug>(xmpfilter-run)
autocmd FileType ruby imap <buffer> <leader>r <Plug>(xmpfilter-run)

autocmd FileType ruby,eruby let g:rubycomplete_buffer_loading = 1
autocmd FileType ruby,eruby let g:rubycomplete_classes_in_global = 1
autocmd FileType ruby,eruby let g:rubycomplete_include_object = 1
autocmd FileType ruby,eruby let g:rubycomplete_include_objectspace = 1

" Autoclose Nerdtree if its the last window
function! NERDTreeQuit()
  redir => buffersoutput
  silent buffers
  redir END
"                     1BufNo  2Mods.     3File           4LineNo
  let pattern = '^\s*\(\d\+\)\(.....\) "\(.*\)"\s\+line \(\d\+\)$'
  let windowfound = 0

  for bline in split(buffersoutput, "\n")
    let m = matchlist(bline, pattern)

    if (len(m) > 0)
      if (m[2] =~ '..a..')
        let windowfound = 1
      endif
    endif
  endfor

  if (!windowfound)
    quitall
  endif
endfunction

autocmd WinEnter * call NERDTreeQuit()
