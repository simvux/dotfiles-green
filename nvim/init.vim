" Plug
call plug#begin('~/.config/nvim/plugged')

Plug 'sebastianmarkow/deoplete-rust'
Plug 'luochen1990/rainbow'
Plug 'easymotion/vim-easymotion'
Plug 'junegunn/fzf', { 'dir': '~/.fzf', 'do': './install --all' }
"Plug 'Yggdroot/indentLine'
Plug 'rust-lang/rust.vim'
Plug 'junegunn/fzf.vim'
Plug 'Shougo/deoplete.nvim', { 'do': ':UpdateRemotePlugins' }
Plug 'xuhdev/vim-latex-live-preview', { 'for': 'tex' }
Plug 'vim-perl/vim-perl6'
Plug 'vim-scripts/vim-auto-save'
Plug 'fidian/hexmode'
Plug 'aurieh/discord.nvim', { 'do': ':UpdateRemotePlugins'}
Plug 'fatih/vim-go', { 'do': ':GoUpdateBinaries' }
Plug 'Shougo/deoplete.nvim'
Plug 'zchee/deoplete-go', { 'do': 'make'}
Plug 'Shougo/deoplete.nvim'
Plug 'pbogut/deoplete-elm'
Plug 'vim-syntastic/syntastic'
Plug 'itchyny/lightline.vim'
Plug 'elmcast/elm-vim'
Plug 'jiangmiao/auto-pairs'
Plug 'chrisbra/Colorizer'
Plug 'neovimhaskell/haskell-vim'
Plug 'unblevable/quick-scope'

call plug#end()

" Colored matching ([{}])
let g:rainbow_active = 0

" Rust
let g:rustfmt_autosave = 1

" Autosave
let g:auto_save_in_insert_mode = 0

" Deoplete
let g:deoplete#enable_at_startup = 1

" F-T hinting
let g:qs_highlight_on_keys = ['f', 'F', 't', 'T']

autocmd FileType rust map <buffer> <C-c> :RustRun<CR>
autocmd FileType go map <buffer> <C-c> :GoTest<CR>
" autocmd FileType elm map <buffer> <C-c> :!elm make src/Main.elm --output="www/index.html"
autocmd FileType elm map <buffer> <C-c> :wa <BAR> !../build<CR>

" Double tap esc to de-hightlight
nnoremap <esc><esc> :silent! nohls<cr>

filetype plugin indent on

" enable colors
syntax on

" Enable native vim stuff
set title
set tabstop=4
" Autoclear search HL
let g:incsearch#auto_nohlsearch = 1
" Split line/color 
set fillchars+=vert:\| 
hi VertSplit ctermbg=NONE guibg=NONE cterm=NONE ctermfg=5
set ignorecase
set hlsearch
set incsearch
set scrolloff=10
" Clear on shell command
map :! :!clear;
" Scrolling keys
nnoremap <A-j> <C-e>
nnoremap <A-k> <C-y>
" Ctrl+hjkl for split momvement.
let g:BASH_Ctrl_j = 'off'
nnoremap <C-j> <C-W><C-J>
nnoremap <C-k> <C-W><C-K>
nnoremap <C-l> <C-W><C-L>
nnoremap <C-h> <C-W><C-H>
" Don't wrap the bloody text ffs, why would anyone want that? Looks like shit
set nowrap
" Set spellcheck lang, still have to manually enable with :set spell
set spelllang=sv

" vim-go
" let g:go_fold_enable = ['block', 'import', 'varconst', 'package_comment']
let g:go_highlight_extra_types = 1
let g:go_highlight_operators = 1
let g:go_highlight_functions = 1
let g:go_highlight_function_arguments = 1
let g:go_highlight_function_calls = 1
let g:go_highlight_types = 1
let g:go_highlight_variable_assignments = 1
let g:go_highlight_fields = 1
let g:go_highlight_methods = 1
let g:go_highlight_extra_types = 1
let g:go_highlight_generate_tags = 1


" Syntastic
set statusline+=%#warningmsg#
set statusline+=%{SyntasticStatuslineFlag()}
set statusline+=%*
let g:syntastic_go_checkers = ['golint', 'errcheck']
let g:syntastic_go_gometalinter_args = ['--disable-all', '--enable=errcheck']
let g:syntastic_mode_map = { 'mode': 'active', 'passive_filetypes': ['go'] }
let g:syntastic_always_populate_loc_list = 1
let g:syntastic_auto_loc_list = 1
let g:syntastic_check_on_open = 1
let g:syntastic_check_on_wq = 0
let g:go_list_type = "quickfix"

let g:syntastic_mode_map = {
   \ 'mode': 'active',
   \ 'passive_filetypes': ['tex'] }

" W to save as sudo
command W w !sudo tee % > /dev/null

" latex
filetype plugin indent on
set grepprg=grep\ -nH\ $*
let g:tex_flavor = "latex"
" autocmd FileType tex setl updatetime=1
let g:livepreview_previewer = 'mupdf.update'


" Return to last edit position when opening files
autocmd BufReadPost *
     \ if line("'\"") > 0 && line("'\"") <= line("$") |
     \   exe "normal! g`\"" |
     \ endif
" Remember info about open buffers on close
set viminfo^=%

" Indentation Colors
let g:indent_guides_enable_on_vim_startup = 0
set ts=4 sw=4 et
let g:indent_guides_guide_size = 1
let g:indent_guides_start_level = 2

" Arduino
let g:arduino_dir = '/usr/share/arduino'
au BufRead,BufNewFile *.pde set filetype=arduino
au BufRead,BufNewFile *.ino set filetype=arduino

" Color fixes alacritty
hi Statement term=bold ctermfg=11 gui=bold guifg=#ffff60
hi Constant term=underline ctermfg=13 guifg=#ffa0a0
hi Visual ctermfg=5 ctermbg=0

" ELM
let g:syntastic_always_populate_loc_list = 1
let g:syntastic_auto_loc_list = 0
let g:elm_syntastic_show_warnings = 1

" lightline
set laststatus=2
set noshowmode

" Deoplete 
let g:AutoPairsShortcutFastWrap='' " Fix it from messing up the å swedish character
let g:deoplete#enable_ignore_case = 1
set completeopt+=noinsert
hi PmenuSel ctermfg=0 ctermbg=5
hi Pmenu ctermfg=5 ctermbg=0

" Custom commands
map :ec :!elm-make Main.elm --output="../www/

" Go code color 
hi goFunctionCall ctermfg=5
hi goString ctermfg=8
hi goSignedInts ctermfg=165
hi goUnsignedInts ctermfg=165
hi goFloats ctermfg=165
hi QuickFixLine ctermbg=0

" Folding colors 
hi Folded ctermbg=16
hi Folded ctermfg=165

" nasm color highlighting
au BufRead,BufNewFile *.nasm (:setf nasm)

" FZF
map <C-t> :Files<CR>

" Haskell
let g:haskell_enable_quantification = 1   " to enable highlighting of `forall`
let g:haskell_enable_recursivedo = 1      " to enable highlighting of `mdo` and `rec`
let g:haskell_enable_arrowsyntax = 1      " to enable highlighting of `proc`
let g:haskell_enable_pattern_synonyms = 1 " to enable highlighting of `pattern`
let g:haskell_enable_typeroles = 1        " to enable highlighting of type roles
let g:haskell_enable_static_pointers = 1  " to enable highlighting of `static`
let g:haskell_backpack = 1                " to enable highlighting of backpack keywords
