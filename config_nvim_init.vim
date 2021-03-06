call plug#begin('~/.vim/plugged')
"======================================================
Plug 'scrooloose/nerdtree', { 'on':  'NERDTreeToggle' }
Plug 'Xuyuanp/nerdtree-git-plugin'
"======================================================
Plug 'jiangmiao/auto-pairs'
"======================================================
Plug 'tpope/vim-fugitive'
Plug 'airblade/vim-gitgutter'
"======================================================
Plug 'kien/ctrlp.vim'
"======================================================
Plug 'nathanaelkane/vim-indent-guides'
"======================================================
Plug 'vim-syntastic/syntastic'
"======================================================
Plug 'majutsushi/tagbar'
Plug 'vim-airline/vim-airline'
Plug 'godlygeek/tabular'
Plug 'fatih/vim-go', { 'do': ':GoUpdateBinaries' }
Plug 'othree/html5.vim'
Plug 'mattn/emmet-vim'
"Color themes
Plug 'morhetz/gruvbox'
Plug 'robu3/vimongous'
"For CocInstall and so on
Plug 'neoclide/coc.nvim', {'branch': 'release'}
Plug 'junegunn/fzf', { 'do': { -> fzf#install() } }

call plug#end()

syntax on
colorscheme pablo
set background=dark
set number
set tabstop=4
set shiftwidth=4
set smarttab
set expandtab

set hlsearch
set incsearch

"Collapse block with v + zf
"Expand   block with zo
set foldmethod=manual

"To copy piece of text to shared buffer:
" :set nonu "delete numbers of strings
" copy with Ctrl+Shift+C
" :set nu   "return numbers of strings

"================================================
"NerdTree and NerdTreeGit
let g:NERDTreeIndicatorMapCustom = {
    \ "Modified"  : "✹",
    \ "Staged"    : "✚",
    \ "Untracked" : "✭",
    \ "Renamed"   : "➜",
    \ "Unmerged"  : "═",
    \ "Deleted"   : "✖",
    \ "Dirty"     : "✗",
    \ "Clean"     : "✔︎",
    \ 'Ignored'   : '☒',
    \ "Unknown"   : "?"
    \ }
let g:NERDTreeShowIgnoredStatus = 1

autocmd bufenter * if (winnr("$") == 1 && exists("b:NERDTree") && b:NERDTree.isTabTree()) | q | endif

function! NERDTreeHighlightFile(extension, fg, bg, guifg, guibg)
 exec 'autocmd filetype nerdtree highlight ' . a:extension .' ctermbg='. a:bg .' ctermfg='. a:fg .' guibg='. a:guibg .' guifg='. a:guifg
 exec 'autocmd filetype nerdtree syn match ' . a:extension .' #^\s\+.*'. a:extension .'$#'
endfunction

call NERDTreeHighlightFile('jade', 'green', 'none', 'green', '#151515')
call NERDTreeHighlightFile('ini', 'yellow', 'none', 'yellow', '#151515')
call NERDTreeHighlightFile('md', 'blue', 'none', '#3366FF', '#151515')
call NERDTreeHighlightFile('yml', 'yellow', 'none', 'yellow', '#151515')
call NERDTreeHighlightFile('config', 'yellow', 'none', 'yellow', '#151515')
call NERDTreeHighlightFile('conf', 'yellow', 'none', 'yellow', '#151515')
call NERDTreeHighlightFile('json', 'yellow', 'none', 'yellow', '#151515')
call NERDTreeHighlightFile('html', 'yellow', 'none', 'yellow', '#151515')
call NERDTreeHighlightFile('styl', 'cyan', 'none', 'cyan', '#151515')
call NERDTreeHighlightFile('css', 'cyan', 'none', 'cyan', '#151515')
call NERDTreeHighlightFile('coffee', 'Red', 'none', 'red', '#151515')
call NERDTreeHighlightFile('js', 'Red', 'none', '#ffa500', '#151515')
call NERDTreeHighlightFile('php', 'Magenta', 'none', '#ff00ff', '#151515')
call NERDTreeHighlightFile('go', 'blue', 'none', 'red', '#151515')
"================================================

"=================================================
"INDENT GUIDES
let g:indent_guides_enable_on_vim_startup = 1
"=================================================
"HTML 5
let g:html5_event_handler_attributes_complete = 0
let g:html5_rdfa_attributes_complete = 0
let g:html5_microdata_attributes_complete = 0
let g:html5_aria_attributes_complete = 0
"=================================================
"Setting vim-syntastic
set statusline+=%#warningmsg#
set statusline+=%{SyntasticStatuslineFlag()}
set statusline+=%*

let g:syntastic_always_populate_loc_list = 0
let g:syntastic_auto_loc_list            = 0
let g:syntastic_check_on_open            = 0
let g:syntastic_check_on_wq              = 0
let g:syntastic_asm_checkers             = ['asm', 'asm/0']
":echo syntastic#util#system('echo "$PATH"')
"=================================================
"Emmet
let g:user_emmet_mode='n'    "only enable normal mode functions.
let g:user_emmet_install_global = 0

autocmd FileType html,css EmmetInstall
"=================================================
"GCC config
map <F7>   :!g++ %<CR>
map <F6>   :!./a.out<CR>
"=================================================

"Mappings 

map <C-n>  : NERDTreeToggle<CR>
map <C-s>  : w<CR>
nmap <F8>  : TagbarToggle<CR>
nmap <F10> : SyntasticCheck 0<CR>
map <F9>   : Tabularize /
