call plug#begin('~/.vim/plugged')

Plug 'scrooloose/nerdtree'
Plug 'scrooloose/nerdcommenter'
Plug 'neoclide/coc.nvim', {'branch': 'release'}
Plug 'majutsushi/tagbar'
Plug 'junegunn/fzf', { 'dir': '~/.fzf', 'do': './install --all' }
Plug 'junegunn/fzf.vim'
Plug 'vim-airline/vim-airline'
"Plug 'vim-airline/vim-airline-themes'
Plug 'easymotion/vim-easymotion'
Plug 'jiangmiao/auto-pairs'
Plug 'schickling/vim-bufonly'
Plug 'terryma/vim-multiple-cursors'
Plug 'tpope/vim-surround'
Plug 'Yggdroot/indentLine'
Plug 'junegunn/rainbow_parentheses.vim'
Plug 'ryanoasis/vim-devicons'
Plug 'tpope/vim-repeat'
Plug 'liuchengxu/vim-clap'
Plug 'alvan/vim-closetag'

"---------------------
" For javascript
"---------------------
Plug 'ianks/vim-tsx'
Plug 'leafgarland/typescript-vim'
Plug 'mxw/vim-jsx'
Plug 'pangloss/vim-javascript'

" for auto import js file
" disable because macos use ctags 100% (java)
" Plug 'ludovicchabant/vim-gutentags'
" Plug 'kristijanhusak/vim-js-file-import', {'do': 'npm install'}
"---------------------

Plug 'fatih/vim-go', { 'do': ':GoUpdateBinaries' }

" better java highlight
Plug 'uiiaoo/java-syntax.vim'

"Plug 'dracula/vim', { 'as': 'dracula' }
"Plug 'dikiaap/minimalist'
"Plug 'morhetz/gruvbox'
"Plug 'joshdick/onedark.vim'
"Plug 'kaicataldo/material.vim'
"Plug 'sainnhe/gruvbox-material'
"Plug 'kristijanhusak/vim-hybrid-material'

"Plug 'tpope/vim-fugitive'
"Plug 'airblade/vim-gitgutter'

call plug#end()

"---------------------
"Initialize
"---------------------
let g:coc_global_extensions = ['coc-tslint-plugin', 'coc-tsserver', 'coc-emmet', 'coc-css', 'coc-html', 'coc-json', 'coc-yank', 'coc-prettier']
au BufNewFile,BufRead *.ts setlocal filetype=typescript:
au BufNewFile,BufRead *.tsx setlocal filetype=typescript.tsx

filetype plugin on
syntax on

set number
set autoread
set autowrite

set tabstop=4
set shiftwidth=4
set expandtab

set termguicolors
set t_Co=256

let g:enable_bold_font = 1
let g:enable_italic_font = 1
set background=dark
colorscheme hybrid_reverse
"colorscheme hybrid_material

" Indent line color
let g:indentLine_color_term = 239

"set scrolloff=5
:nnoremap <Leader>ts :let &scrolloff=999-&scrolloff<CR> " ToggleScrolloff

set encoding=UTF-8
set guifont=RobotoMono\ Nerd\ Font:h12
let g:airline_powerline_fonts = 1

" seting gopls for GoLang
let g:go_def_mode='gopls'
let g:go_info_mode='gopls'

" Turn off default highlight java
highlight link JavaIdentifier NONE


"---------------------
" My customize mapping key
"---------------------
let mapleader = "\<space>"
noremap <Up> <NOP>
noremap <Down> <NOP>
noremap <Left> <NOP>
noremap <Right> <NOP>
"noremap g; $
map <C-j> <C-W>j
map <C-k> <C-W>k
map <C-h> <C-W>h
map <C-l> <C-W>l

" In insert or command mode, move normally by using Ctrl
inoremap <C-h> <Left>
inoremap <C-j> <Down>
inoremap <C-k> <Up>
inoremap <C-l> <Right>
inoremap <C-w> <C-o>w
inoremap <C-e> <C-o>e
inoremap <C-b> <C-o>b

cnoremap <C-h> <Left>
cnoremap <C-j> <Down>
cnoremap <C-k> <Up>
cnoremap <C-l> <Right>

" Remaping pasting when past insert mode only for ubuntu
"inoremap <C-v> <C-r>+

" quick navigate buffer
" {count}CTRL-^ switches to the count numbered buffer.
nnoremap gp :bprevious<CR>
nnoremap gn :bnext<CR>
nnoremap gt :bfirst<CR>
nnoremap gl :blast<CR>
nnoremap gw :bd<CR>
nnoremap <C-b> :ls<CR>:b<Space>

nnoremap <leader><tab> :b#<cr>

" Delete without yank
nnoremap <leader>d "_d
vnoremap <leader>d "_d
vnoremap <leader>p "_dP

" Select entire line, without the new line character
vnoremap al :<C-U>normal 0v$h<CR>
omap al :normal val<CR>
vnoremap il :<C-U>normal ^vg_<CR>
omap il :normal vil<CR>

"-----------------
"Power line
"----------------
let g:airline_powerline_fonts = 1
let g:airline#extensions#tabline#enabled = 1
let g:airline#extensions#tabline#buffer_nr_show = 1

"---------------------
" Startup
"---------------------
autocmd VimEnter * NERDTree
"autocmd VimEnter * nested :TagbarOpen

" fixes an issue that detect typescript as XML in UBUNTU
"autocmd BufNewFile,BufRead *.ts setlocal filetype=typescript
"autocmd BufNewFile,BufRead *.tsx setlocal filetype=typescriptreact

"---------------------------
" Other plugin configuration
"--------------------------
source ~/.config/nvim/coc-config.vim
source ~/.config/nvim/easy-motion.vim
source ~/.config/nvim/nerd-tree.vim
source ~/.config/nvim/tagbar.vim

"----------------------------
" Close tag
"----------------------------
" filenames like *.xml, *.html, *.xhtml, ...
" These are the file extensions where this plugin is enabled.
"
let g:closetag_filenames = '*.html,*.xhtml,*.phtml'

" filenames like *.xml, *.xhtml, ...
" This will make the list of non-closing tags self-closing in the specified files.
"
let g:closetag_xhtml_filenames = '*.xhtml,*.jsx'

" filetypes like xml, html, xhtml, ...
" These are the file types where this plugin is enabled.
"
let g:closetag_filetypes = 'html,xhtml,phtml'

" filetypes like xml, xhtml, ...
" This will make the list of non-closing tags self-closing in the specified files.
"
let g:closetag_xhtml_filetypes = 'xhtml,jsx'

" integer value [0|1]
" This will make the list of non-closing tags case-sensitive (e.g. `<Link>` will be closed while `<link>` won't.)
"
let g:closetag_emptyTags_caseSensitive = 1

" dict
" Disables auto-close if not in a "valid" region (based on filetype)
"
let g:closetag_regions = {
    \ 'typescript.tsx': 'jsxRegion,tsxRegion',
    \ 'javascript.jsx': 'jsxRegion',
    \ }

" Shortcut for closing tags, default is '>'
"
let g:closetag_shortcut = '>'

" Add > at current position without closing the current tag, default is ''
"
let g:closetag_close_shortcut = '<leader>>'

"---------------------------
" FZF
"---------------------------
let $FZF_DEFAULT_COMMAND = 'rg --files --no-ignore-vcs --hidden --smart-case --ignore-case --follow -g "!.git/*" -g "!node_modules/*" -g "!*/**/node_modules/*" -g "!*/**/Pods/*" -g "!build/*"  -g "!*/**/build/*" -g "!.idea/*" -g "!*/**/.idea/*" -g "!.gradle/*" -g "!*/**/.gradle/*" -g "!.vscode/*" -g "!*/**/.vscode/*" -g "!*.class"'

command! -bang -nargs=* Find call fzf#vim#grep('rg --column --line-number --no-heading --fixed-strings --ignore-case --hidden --follow --glob "!.git/*" --glob "!node_modules/*" -g "!*/**/Pods/*" -g "!*/**/build/*" --glob "!.gitignore" -g "!*package*.json" -g "!*.lock" -g "!*.md"  -g "!.idea/*" -g "!*/**/.idea/*" -g "!.gradle/*" -g "!*/**/.gradle/*" -g "!.vscode/*" -g "!*/**/.vscode/*" -g "!*.class" --color "always" '.shellescape(<q-args>), 1, <bang>0)

map <C-t> :FZF<CR>
nnoremap <silent> <C-t> :FZF<CR>
autocmd VimEnter * noremap <C-t> :FZF<CR>
autocmd FileType go map <C-n> :FZF<CR>
nnoremap <silent> <C-f> :Find 

nmap <Leader>u :Buffers<CR>
nmap <Leader>h :History<CR>
nmap <Leader>t :BTags<CR>
nmap <Leader>T :Tags<CR>
nmap <Leader>m :BLines<CR>
nmap <Leader>n :Lines<CR>
nmap <Leader>' :Marks<CR>j
nmap <Leader>bo :Bonly<CR>

"--------------------------
" Clap
"--------------------------
nmap <Leader>g :Clap registers<CR>
nmap <Leader>,b :Clap buffers<CR>
nmap <Leader>y :Clap yanks<CR>
nmap <Leader>,m :Clap marks<CR>
nmap <Leader>,f :Clap files<CR>
nmap <Leader>,t :Clap tags<CR>
nmap <Leader>,c :Clap commits<CR>

"--------------------------
" Source final overlap
"--------------------------
"source ~/.config/nvim/zzmappings.vim


"----------UNUSE---------------
"-------------------------
" fugitive git bindings
"-------------------------
""nnoremap <space>ga :Git add %:p<CR><CR>
"nnoremap <space>gs :Gstatus<CR>
"nnoremap <space>gc :Gcommit -v -q<CR>
"nnoremap <space>gt :Gcommit -v -q %:p<CR>
"nnoremap <space>gd :Gdiff<CR>
"nnoremap <space>ip :diffput<CR>
"nnoremap <space>ig :diffget<CR>
"nnoremap <space>ge :Gedit<CR>
"nnoremap <space>gr :Gread<CR>
"nnoremap <space>gw :Gwrite<CR><CR>
"nnoremap <space>gl :silent! Glog<CR>:bot copen<CR>
"nnoremap <space>gp :Ggrep<Space>
"nnoremap <space>gm :Gmove<Space>
""nnoremap <space>gb :Git branch<Space>
""nnoremap <space>go :Git checkout<Space>
"nnoremap <space>gb :Gblame<CR> 
"nnoremap <space>gps :Dispatch! git push<CR>
"nnoremap <space>gpl :Dispatch! git pull<CR>

"-------------------------
" Gitgutter
"-------------------------
"nmap ]h <Plug>(GitGutterNextHunk)
"nmap [h <Plug>(GitGutterPrevHunk)
"nmap <space>ghs <Plug>(GitGutterStageHunk)
"nmap <space>ghu <Plug>(GitGutterUndoHunk)