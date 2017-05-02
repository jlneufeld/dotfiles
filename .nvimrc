set rtp+=~/.config/nvim/bundle/Vundle.vim
let path='~/.config/nvim/bundle'
call vundle#begin(path)
    Plugin 'gmarik/Vundle.vim'
    Plugin 'randy3k/wombat256.vim'
    Plugin 'godlygeek/tabular'
    Plugin 'LaTeX-Box-Team/LaTeX-Box'
    Plugin 'vim-airline/vim-airline'
    Plugin 'vim-airline/vim-airline-themes'
    Plugin 'kien/ctrlp.vim'
    Plugin 'scrooloose/nerdtree'
    Plugin 'kassio/neoterm'
    " Plugin 'epeli/slimux'
    " Plugin 'terryma/vim-multiple-cursors'
    " Plugin 'jalvesaq/Nvim-R'
call vundle#end()


syntax enable
filetype plugin on
filetype indent on
set mouse=a
set wildignorecase
if &buftype != 'terminal'
  set number
end
set tabstop=4
set shiftwidth=2
set expandtab
set cursorline
set backspace=2
set clipboard=unnamed
" set notimeout
" set ttimeout
if has("gui_vimr")
    set termguicolors
endif

let g:terminal_color_0  = '#000000'
let g:terminal_color_1  = '#ff8787'
let g:terminal_color_2  = '#87d75f'
let g:terminal_color_3  = '#ffd75f'
let g:terminal_color_4  = '#87afff'
let g:terminal_color_5  = '#af87ff'
let g:terminal_color_6  = '#d7ff87'
let g:terminal_color_7  = '#bfbfbf'
let g:terminal_color_8  = '#000000'
let g:terminal_color_9  = '#ff8787'
let g:terminal_color_10 = '#87d75f'
let g:terminal_color_11 = '#ffd75f'
let g:terminal_color_12 = '#87afff'
let g:terminal_color_13 = '#af87ff'
let g:terminal_color_14 = '#d7ff87'
let g:terminal_color_15 = '#bfbfbf'
color wombat256mod
let g:airline_theme='wombat'
let g:airline_powerline_fonts=1
set laststatus =2
set ttimeoutlen=50

map <F10> :echo "hi<" . synIDattr(synID(line("."),col("."),1),"name") . '> trans<'
\ . synIDattr(synID(line("."),col("."),0),"name") . "> lo<"
\ . synIDattr(synIDtrans(synID(line("."),col("."),1)),"name") . ">"<CR>


noremap <C-f> <C-d>
noremap <C-b> <C-u>

tnoremap <esc> <C-\><C-n>
tnoremap jk <C-\><C-n>
inoremap jk <esc>
cnoremap jk <C-c>

nnoremap <tab> <C-w>w
nnoremap <S-tab> <C-w>W

g:neoterm_autoscroll = 1
augroup neoterm_keybinds
  autocmd!
  " autocmd filetype r,python inoremap <buffer> <silent> <C-j> <esc>:TREPLSendLine<CR>jI
  autocmd filetype r,python nnoremap <buffer> <silent> <C-j> :TREPLSendLine<CR>j
  autocmd filetype r,python vnoremap <buffer> <silent> <C-j> :TREPLSendSelection<CR>gv
augroup end
nnoremap <C-k> <Up>
nnoremap <C-l> <Right>

inoremap <C-h> <Left>
inoremap <C-j> <Down>
inoremap <C-k> <Up>
inoremap <C-l> <Right>

cnoremap <C-h> <Left>
cnoremap <C-j> <Down>
cnoremap <C-k> <Up>
cnoremap <C-l> <Right>

" disable ctrlp default keybind
let g:ctrlp_map = ''

" spacemacs like keybinds

" zoom / restore window
function! s:ZoomToggle() abort
    if exists('t:zoomed') && t:zoomed
        exec t:zoom_winrestcmd
        let t:zoomed = 0
    else
        let t:zoom_winrestcmd = winrestcmd()
        resize
        vertical resize
        let t:zoomed = 1
    endif
endfunction
command! ZoomToggle call s:ZoomToggle()

function! s:WinLayoutToggle() abort
    if exists('t:horizonal') && t:horizonal
        let t:horizonal = 0
        execute "windo wincmd K"
    else
        let t:horizonal = 1
        execute "windo wincmd H"
    endif
endfunction
command! WinLayoutToggle call s:WinLayoutToggle()

nmap <space>bb :buffers<CR>
nmap <space>bd :bdelete<CR>
nmap <space>bn :bn<CR>
nmap <space>bp :bp<CR>
nmap <space>bR :e<CR>

nmap <space>fed :e ~/.nvimrc<CR>
nmap <space>feR :source ~/.nvimrc<CR>
nmap <space>ff :CtrlPCurFile<CR>
nmap <space>fr :CtrlPMRU<CR>
nmap <space>fs :w<CR>
nmap <space>fS :wa<CR>
nmap <space>ft :NERDTreeToggle<CR>

nmap <space>tn :set number!<CR>
nmap <space>tl :set wrap!<CR>

nnoremap <silent> <space>l :nohlsearch<CR><C-l>

nmap <space>w- :sp<CR>
nmap <space>w/ :vsp<CR>
nmap <space>w= <C-w>=
nmap <space>wc :q<CR>
nmap <space>wh <C-w>h
nmap <space>wH <C-w>H
nmap <space>wj <C-w>j
nmap <space>wk <C-w>k
nmap <space>wl <C-w>l
nmap <space>wL <C-w>L
nmap <space>ws <C-w>s
nmap <space>wv <C-w>v
nmap <space>wm :ZoomToggle<CR>
nmap <space>w+ :WinLayoutToggle<CR>
nmap <space>ww <C-w><C-w>
