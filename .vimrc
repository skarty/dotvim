" vim: fdm=marker ts=2 sts=2 sw=2 fdl=0

" Variables {{{
let mapleader = ","
let s:is_windows = has('win32') || has('win64')
"}}}

" Setting up vim-plug as the package manager {{{
if !filereadable(expand("~/.vim/autoload/plug.vim"))
    echo "Installing vim-plug and plugins. Restart vim after finishing the process."
    silent call mkdir(expand("~/.vim/autoload", 1), 'p')
    execute "!curl -fLo ".expand("~/.vim/autoload/plug.vim", 1)." https://raw.githubusercontent.com/junegunn/vim-plug/master/plug.vim"
    autocmd VimEnter * PlugInstall
endif 

if s:is_windows
  set rtp+=~/.vim
endif




call plug#begin('~/.vim/plugged')
let g:plug_url_format = 'https://github.com/%s.git'

"}}}

" PLUGINS
Plug 'morhetz/gruvbox'
Plug 'vim-latex/vim-latex'
Plug 'scrooloose/nerdtree', { 'on':  'NERDTreeToggle' }
  map <F2> :NERDTree d:\Matematik<CR>
  map <C-n> :NERDTreeToggle<CR>
  nnoremap <silent> <F4> :NERDTreeToggle<CR>
  nnoremap <silent> <F5> :NERDTreeFind<CR>
Plug 'rking/ag.vim'
"Plug 'SirVer/ultisnips'
let g:UltiSnipsExpandTrigger="½"
let g:UltiSnipsJumpForwardTrigger="<c-b>"
let g:UltiSnipsJumpBackwardTrigger="<c-z>"
Plug 'honza/vim-snippets'
Plug 'bling/vim-airline'
Plug 'c:\home\.vim\plugged\YouCompleteMe'
  
  call plug#end()


colorscheme gruvbox

"Remap taster

nnoremap dd :UltiSnipsEdit<CR>
nnoremap <Esc> i
imap <Esc> <Esc>
nnoremap j k
nnoremap . :
nnoremap k j

if has("gui_running")
  if has("gui_macvim")
    set guifont=Consolas:h15
  elseif has("gui_win32")
    autocmd GUIEnter * simalt ~x " open maximize in Windows
    set guifont=Consolas:h11
  endif
  set guioptions= " disable all UI options
  set guicursor+=a:blinkon0 " disable blinking cursor
  autocmd GUIEnter * set visualbell t_vb=
else
  set noerrorbells visualbell t_vb=
  set term=xterm
  set t_ut= " setting for looking properly in tmux
  set t_ti= t_te= " prevent vim from clobbering the scrollback buffer
  let &t_Co = 256
  if s:is_windows " trick to support 256 colors and scroll in conemu
    let &t_AF="\e[38;5;%dm"
    let &t_AB="\e[48;5;%dm"
    inoremap <esc>[62~ 3<c-x><c-e>
    inoremap <esc>[63~ 3<c-x><c-y>
    nnoremap <esc>[62~ 3<c-e>
    nnoremap <esc>[63~ 3<c-y>
  endif
endif

augroup CustomColors
  autocmd!
  autocmd ColorScheme * highlight CursorLine cterm=bold ctermbg=NONE gui=bold guibg=NONE
augroup END


set number "nnn
set numberwidth=1
set mouse=a

filetype plugin on

set shellslash


set grepprg=grep\ -nH\ $*

filetype indent on


let g:tex_flavor='latex'

set sw=2

set iskeyword+=:
cmap Q q




