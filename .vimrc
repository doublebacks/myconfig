"=========================================
"    General settings
"=========================================
behave xterm
syntax on
set fileformat=unix
set nocompatible
set backspace=indent,eol,start
set selectmode=key
set tabstop=4
set shiftwidth=4
set cindent shiftwidth=4
set expandtab
set ruler
set number
set hlsearch
set incsearch
set wrap
set linebreak
set paste
"set showmatch
"set visualbell
set scrolloff=2
set shellslash
set grepprg=grep\ -nH\ $*
set encoding=chinese
"set langmenu=zh_CN.GBK
set langmenu=none
set helplang=cn
set imcmdline
"set guifont=DejaVu\ Sans\ Mono\ 11
set guifont=Consolas:h18
set linespace=0
set matchpairs+=<:>
set showcmd
set whichwrap+=<,>,[,]
set wildmenu
set wildmode=list:longest,full
set guioptions-=T
set mouse=a
set tabpagemax=30
"set cursorline
set ve=block
"enable 256 color term
set t_Co=256
source $VIMRUNTIME/delmenu.vim
source $VIMRUNTIME/menu.vim

filetype plugin on
filetype indent on

"Auto change to directory of the current file
autocmd BufEnter * lcd %:p:h

"Auto complete keyword according syntax file
au BufEnter * exec('setlocal complete+=k$VIMRUNTIME/syntax/'.&ft.'.vim')
"Add c.vim to keyword files when filetype is c++
"au BufEnter * exec('setlocal complete+=k$VIMRUNTIME/syntax/c.vim')

"=========================================
"    Highlight settings
"=========================================
"There seems a bug from 7.0209(?), some highlight command
"have no effect in .vimrc file, I had to put them into 
"a color scheme file.
"colorscheme zy
colorscheme oceandeep

"=========================================
"   Key mapping 
"=========================================
let mapleader=","
map <C-n> :hide bnext<Enter>
map <C-p> :hide bprevious<Enter>
map <C-Pagedown> :tabnext<Enter>
map <C-Pageup> :tabprevious<Enter>
map <C-s> :w!<Enter>
imap jj <Esc> 
imap <C-s> <Esc>:w!<Enter>
"map <C-w> :w!<Enter>:bd<Enter>
map <C-q> :bd!<Enter>
map <F2> :tabnew 
map <F4> :wqa!<Enter>
imap <F4> <Esc>:wqa!<Enter>
"map <F5> :qa!<Enter>
"imap <F5> <Esc>:qa!<Enter>
map <F6> :w!<Enter>
imap <F6> <Esc>:w!<Enter>
map <Up> gk
map <Down> gj
map <Leader>sa ggVG
map <Leader>ve :set ve=all<Enter>
map <Leader>nv :set ve=<Enter>
map gf :hide e <cfile><Enter>
"Use 'n' to search selected text in visual mode
vmap n y/\V<C-R>=substitute(escape(@",'/'),"\n","\\\\n","g")<CR>/<CR>
autocmd FileType python map <F12> :pyfile %<Enter>
autocmd FileType python imap <F12> <Esc>:pyfile %<Enter>
"Windows splitting maps
map <M-0> :close<Enter>
map <M-1> :only<Enter>
map <M-2> :split<Enter>
map <M-3> :vs<Enter>
imap <M-0> <Esc>:close<Enter>
imap <M-1> <Esc>:only<Enter>
imap <M-2> <Esc>:split<Enter>
imap <M-3> <Esc>:vs<Enter>


"=========================================
"  Plugin settings 
"=========================================
"MInibuf plugin setting
let g:miniBufExplMapWindowNavVim = 1
let g:miniBufExplMapWindowNavArrows = 1
let g:miniBufExplMapCTabSwitchBufs = 1
let g:miniBufExplModSelTarget = 1
let g:miniBufExplVSplit = 20
highlight MBEVisibleNormal guifg=Brown ctermfg=Brown

"Customize bufexplorer plugin
map <F3> :BufExplorer<Enter>
let g:bufExplorerSplitHorzSize = 10
let g:bufExplorerSplitVertSize = 25

"taglist plugin setting
let Tlist_File_Fold_Auto_Close  = 1
let Tlist_Use_Right_Window = 1
map <F7> :Tlist<Enter>

"vtreeexplorer plugin setting
let g:treeExplVertical = 1
map <Leader>te :VTreeExplore<Enter>
map <Leader>ts :VSTreeExplore<Enter>

"Show the number of windows in the tab page and a '+' if there is a modifed buffer
function GuiTabLabel()
  let label = ''
  let bufnrlist = tabpagebuflist(v:lnum)

  " Add '+' if one of the buffers in the tab page is modified
  for bufnr in bufnrlist
    if getbufvar(bufnr, "&modified")
      let label = '+'
      break
    endif
  endfor
  " Append the number of windows in the tab page if more than one
  let wincount = tabpagewinnr(v:lnum, '$')
  if wincount > 1
    let label .= wincount
  endif
  if label != ''
    let label .= ' '
  endif
  " Append the buffer name
  return label . bufname(bufnrlist[tabpagewinnr(v:lnum) - 1])
endfunction
set guitablabel=%{GuiTabLabel()}

"Setting for backup
set backup
"Use file path as backup file extension, replace ":", "/", "\"
"and " " with "!"
let bkext=substitute(expand("%:p:h"),":\\|/\\|/\\| ","!","g")
exe expand("set backupext=_".bkext."~")
set backupdir=~/draft/tmp

"Fold setting
"set foldmethod=syntax
"autocmd FileType python set foldmethod=indent

"Set indent width to 2 in some filetypes
"autocmd FileType python,verilog set tabstop=2
"autocmd FileType python,verilog set shiftwidth=2

"Set LookupFile
let g:LookupFile_MinPatLength = 2
let g:LookupFile_PreserveLastPattern = 0
let g:LookupFile_PreservePatternHistory = 1
let g:LookupFile_AlwaysAcceptFirst = 1
let g:LookupFile_AllowNewFiles = 1
if filereadable("./filenametags")
   let g:LookupFile_TagExpr = '"./filenametags"'
endif
"nmap <silent> <Leader>lk <Plug>LookupFile<CR>
nmap <silent> <Leader>ll :LUBufs<CR>
nmap <silent> <Leader>lw :LUWalk<CR>
