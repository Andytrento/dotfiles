"""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""
"        _   _       _                  _____             __ _               "
"       | \ | |     (_)                / ____|           / _(_)              "
"       |  \| |_   ___ _ __ ___       | |     ___  _ __ | |_ _  __ _         "
"       |  ` \ \ / / | '_ ` _ \      | |    / _ \| '_ \|  _| |/ _` |        "
"       | |\  |\ V /| | | | | | |     | |___| (_) | | | | | | | (_| |        "
"       |_| \_| \_/ |_|_| |_| |_|      \_____\___/|_| |_|_| |_|\__, |        "
"                                                               __/ |        "
"                                                              |___/         "
"                                                                            "
""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""


call plug#begin('~/.local/share/nvim/pluged')      " let vim-plug manage plugin, required

Plug 'dracula/vim'    "colorscheme
"Plug 'jiangmiao/auto-pairs' "auto pairs
Plug 'sheerun/vim-polyglot'

"coc.nvim
Plug 'neoclide/coc.nvim', {'branch': 'release'}

Plug 'scrooloose/nerdcommenter'       "Commenting
Plug 'christoomey/vim-tmux-navigator' "navigating in tmux
Plug 'tpope/vim-surround'

"Snippets
Plug 'honza/vim-snippets'
Plug 'SirVer/ultisnips'

"Fuzzy search
  Plug 'junegunn/fzf', { 'dir': '~/.fzf', 'do': './install --all' }
  Plug 'junegunn/fzf.vim'

"markdown
  Plug 'junegunn/goyo.vim'
  Plug 'tpope/vim-markdown'

Plug 'lervag/vimtex'          "edit Latex
Plug 'haya14busa/is.vim'      "incremental search improved 
Plug 'yggdroot/indentline'    "indent  line for vim
Plug 'sbdchd/neoformat'       "formatting

call plug#end()       " required

"""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""

" => Basic Settings
"""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""
set autoread                                     " reload on external file changes
set backspace=indent,eol,start                   " backspace behaviour
set clipboard=unnamed,unnamedplus                " enable clipboard
set encoding=utf8                                " enable utf8 support
set hidden                                       " hide buffers, don't close
set mouse=a                                      " enable mouse support
set nowrap                                       " disable wrapping
set number                                       " show line numbers
set relativenumber
"set term=xterm-256color                          " terminal type
set wildmenu wildmode=longest:full,full          " wildmode settings
set completeopt+=menuone,noinsert
"""""""""""""""""
"  UI Settings  "
"""""""""""""""""
filetype plugin indent on                        " enable filetype detection
set listchars=trail:•,tab:▸\               " whitespace characters
set scrolloff=999                                " center cursor position vertically
set showbreak=¬\                                 " Wrapping character
set showmatch                                    " show matching brackets
syntax on                                        " enable syntax highlightning

"Color
let $NVIM_TUI_ENABLE_TRUE_COLOR=1
set t_ut=                " fix 256 colors in tmux http://sunaku.github.io/vim-256color-bce.html
set termguicolors
if has("termguicolors")  " set true colors
  let &t_8f = "\<Esc>[38;2;%lu;%lu;%lum"
  let &t_8b = "\<Esc>[48;2;%lu;%lu;%lum"
  set termguicolors
endif
"hi Normal guibg=NONE ctermbg=NONE|               " transparency fix
"let g:dracula_colorterm = 1
colorscheme dracula                              " set colorscheme
let g:dracula_italic = 0
"set background=dark
"let g:dracula_termcolors=256                     " enable 256 colors support

filetype plugin indent on

highlight Cursor guifg=white guibg=gray
highlight iCursor guifg=white guibg=steelblue

"Status line
set laststatus=0                                 " disable statusline
set ruler rulerformat=%40(%=%<%F%m\ \
      \›\ %{getfsize(@%)}B\ \
      \›\ %l/%L:%v%)


"Performace Tuning
set autoindent expandtab                         " autoindentation & tabbing
set shiftwidth=2 softtabstop=2 tabstop=2         " 1 tab = 2 spaces

set hlsearch ignorecase incsearch smartcase      " search options

set nobackup noswapfile nowritebackup            " disable backup/swap files
set undofile undodir=~/.vim/undo undolevels=9999 " undo options

set lazyredraw                                   " enable lazyredraw
set nocursorline                                 " disable cursorline
set ttyfast                                      " enable fast terminal connection

set splitright
set splitbelow

""""""""""""""
"  Autocmnd  "
""""""""""""""
autocmd BufRead,BufNewFile /tmp/calcurse*,~/.config/.calcurse/notes/* set filetype=markdown

" F9 to run python, JS inside vim
autocmd FileType python map <buffer> <F9> :w<CR>:exec '!python3' shellescape(@%, 1)<CR>
autocmd FileType python imap <buffer> <F9> <esc>:w<CR>:exec '!python3' shellescape(@%, 1)<CR>
autocmd FileType javascript map <buffer> <F9> <esc>:w<CR>:exec '!node' shellescape(@%, 1)<CR>

" Vertically center document when entering insert mode
autocmd InsertEnter * norm zz

""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""
" => Editing mappings
"""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""

"Genral Mappings {{{

let mapleader="\<Space>"
inoremap jk <ESC>

"Avoid annoying case
command! Q :q
command! W :w
command! X :x


" Seamlessly treat visual lines as actual lines when moving around.
noremap j gj
noremap k gk
nnoremap <Leader><Leader> <C-^>

"Search and replace using * 
nnoremap <Leader>r :%s///g<Left><Left>
nnoremap <Leader>rc :%s///gc<Left><Left><Left>
xnoremap <Leader>r :s///g<Left><Left>
xnoremap <Leader>rc :s///gc<Left><Left><Left>
nnoremap <silent> s* :let @/='\<'.expand('<cword>').'\>'<CR>cgn
xnoremap <silent> s* "sy:let @/=@s<CR>cgn

" Enable spell checking, s for spell check
map <leader>s :setlocal spell! spelllang=en<CR>

" Switch between tabs
nnoremap <Leader>1 1gt
nnoremap <Leader>2 2gt
nnoremap <Leader>3 3gt
nnoremap <Leader>4 4gt
nnoremap <Leader>5 5gt
nnoremap <Leader>6 6gt
nnoremap <Leader>7 7gt


"Tmux
if exists('$TMUX')
    let &t_SI = "\<Esc>Ptmux;\<Esc>\e[5 q\<Esc>\\"
    let &t_EI = "\<Esc>Ptmux;\<Esc>\e[2 q\<Esc>\\"
else
    let &t_SI = "\e[5 q"
    let &t_EI = "\e[2 q"
endif

"""""""""""""""
"  Neoformat  "
"""""""""""""""
let g:neoformat_enabled_python = ['black']
nnoremap <Leader>f :Neoformat<CR>

""""""""""""""""
"  Indentline  "
""""""""""""""""

let g:mta_use_matchparen_group = 1
let g:indentline_char_list = '|'


"""""""""""""""""""""
"  UtiSnip setting  "
"""""""""""""""""""""

let g:UltiSnipsExpandTrigger = "<c-j>"
let g:UltiSnipsJumpForwardTrigger = "<c-j>"
let g:UltiSnipsJumpBackwardTrigger = "<c-k>"


"""""""""""""""""""""""""""" fzf settings""""""""""""""""""""""""""

let $FZF_DEFAULT_OPTS = '--bind ctrl-a:select-all'

let g:fzf_action = {
      \ 'ctrl-t': 'tab split',
      \ 'ctrl-s': 'split',
      \ 'ctrl-v': 'vsplit',
      \ 'ctrl-y': {lines -> setreg('*', join(lines, "\n"))}}

"Launch fzf with CTRL+P.

nnoremap <silent> <C-p> :FZF -m<CR>
nnoremap <C-g> :Rg<Cr>

" Map a few common things to do with FZF.
nnoremap <silent> <Leader><Enter> :Buffers<CR>
nnoremap <silent> <Leader>l :Lines<CR>

let g:fzf_layout = { 'window': 'call CreateCenteredFloatingWindow()' }
" files window with preview
command! -bang -nargs=? -complete=dir Files
      \ call fzf#vim#files(<q-args>, fzf#vim#with_preview(), <bang>0)
let $FZF_DEFAULT_OPTS="--reverse "                      " top to bottom


" use rg by default
if executable('rg')
  let $FZF_DEFAULT_COMMAND = 'rg --files --hidden --follow --glob "!.git/*"'
  set grepprg=rg\ --vimgrep
endif

" Allow passing optional flags into the Rg command.
"example: :Rg myterm -g '*.md'
command! -bang -nargs=* Rg call fzf#vim#grep("rg --column --line-number --no-heading --color=always --smart-case " . <q-args>, 1, <bang>0)

let $FZF_DEFAULT_COMMAND = 'rg --files --hidden'

""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""
" =>nerdcommenter  mappings
"""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""
vmap ++ <plug>NERDCommenterToggle
nmap ++ <plug>NERDCommenterToggle


""""""""""""""""""""""
"  markdown settings  "
""""""""""""""""""""""
command! PANDOCPDF silent execute "!pandoc % -o %:r.pdf"
map <f6> :PANDOCPDF<cr>
command! ZATHURA execute "!zathura %:r.pdf"
map <f5> :ZATHURA<cr>


let g:coc_global_extensions = [
      \ 'coc-tsserver',
      \ 'coc-python',
      \ 'coc-pairs'
      \]
" TextEdit might fail if hidden is not set.
set hidden

" Some servers have issues with backup files, see #649.
set nobackup
set nowritebackup

" Give more space for displaying messages.
set cmdheight=2

" Having longer updatetime (default is 4000 ms = 4 s) leads to noticeable
" delays and poor user experience.
set updatetime=300

" Don't pass messages to |ins-completion-menu|.
set shortmess+=c

" Always show the signcolumn, otherwise it would shift the text each time
" diagnostics appear/become resolved.
set signcolumn=yes

" Use tab for trigger completion with characters ahead and navigate.
" NOTE: Use command ':verbose imap <tab>' to make sure tab is not mapped by
" other plugin before putting this into your config.
inoremap <silent><expr> <TAB>
      \ pumvisible() ? "\<C-n>" :
      \ <SID>check_back_space() ? "\<TAB>" :
      \ coc#refresh()
inoremap <expr><S-TAB> pumvisible() ? "\<C-p>" : "\<C-h>"

function! s:check_back_space() abort
  let col = col('.') - 1
  return !col || getline('.')[col - 1]  =~# '\s'
endfunction

" Use K to show documentation in preview window.
nnoremap <silent> K :call <SID>show_documentation()<CR>

function! s:show_documentation()
  if (index(['vim','help'], &filetype) >= 0)
    execute 'h '.expand('<cword>')
  else
    call CocAction('doHover')
  endif
endfunction


" Highlight the symbol and its references when holding the cursor.
autocmd CursorHold * silent call CocActionAsync('highlight')


augroup mygroup
  autocmd!
  " Setup formatexpr specified filetype(s).
  autocmd FileType typescript,json setl formatexpr=CocAction('formatSelected')
  " Update signature help on jump placeholder.
  autocmd User CocJumpPlaceholder call CocActionAsync('showSignatureHelp')
augroup end

" Add `:OR` command for organize imports of the current buffer.
command! -nargs=0 OR   :call     CocAction('runCommand', 'editor.action.organizeImport')

"Color for popup menu
highlight Pmenu ctermbg=8 guibg=#606060
highlight PmenuSel ctermbg=1 guifg=#dddd00 guibg=#1f82cd
highlight PmenuSbar ctermbg=0 guibg=#d6d6d6

"""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""
" === vimtex setting === "
"""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""

let g:tex_flavor='latex'
let g:vimtex_view_method='zathura'
let g:vimtex_fold_enabled = 1

map <F8> :!zathura<space>%:r.pdf<space>&<Enter><Enter>
autocmd filetype tex nmap <buffer> <c-t> :!latexmk -pdf %<cr>
nnoremap <localleader>lt :call vimtex#fzf#run()<cr>

"""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""

" => Helper functions
"""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""
" Returns true if paste mode is enabled
function! HasPaste()
  if &paste
    return 'PASTE MODE  '
  endif
  return ''
endfunction

function! ClipboardYank()
  call system('pbcopy',@@)
endfunction

function! ClipboardPaste()
  let @@=system('pbpaste')
endfunction

vnoremap <silent> y y:call ClipboardYank()<cr>
vnoremap <silent> d d:call ClipboardYank()<cr>
nnoremap <silent> p :call ClipboardPaste()<cr>p

" floating fzf window with borders
function! CreateCenteredFloatingWindow()
  let width = min([&columns - 4, max([80, &columns - 20])])
  let height = min([&lines - 4, max([20, &lines - 10])])
  let top = ((&lines - height) / 2) - 1
  let left = (&columns - width) / 2
  let opts = {'relative': 'editor', 'row': top, 'col': left, 'width': width, 'height': height, 'style': 'minimal'}

  let top = "╭" . repeat("─", width - 2) . "╮"
  let mid = "│" . repeat(" ", width - 2) . "│"
  let bot = "╰" . repeat("─", width - 2) . "╯"
  let lines = [top] + repeat([mid], height - 2) + [bot]
  let s:buf = nvim_create_buf(v:false, v:true)
  call nvim_buf_set_lines(s:buf, 0, -1, v:true, lines)
  call nvim_open_win(s:buf, v:true, opts)
  set winhl=Normal:Floating
  let opts.row += 1
  let opts.height -= 2
  let opts.col += 2
  let opts.width -= 4
  call nvim_open_win(nvim_create_buf(v:false, v:true), v:true, opts)
  au BufWipeout <buffer> exe 'bw '.s:buf
endfunction

function! RipgrepFzf(query, fullscreen)
  let command_fmt = 'rg --column --line-number --no-heading --color=always --smart-case %s || true'
  let initial_command = printf(command_fmt, shellescape(a:query))
  let reload_command = printf(command_fmt, '{q}')
  let spec = {'options': ['--phony', '--query', a:query, '--bind', 'change:reload:'.reload_command]}
  call fzf#vim#grep(initial_command, 1, fzf#vim#with_preview(spec), a:fullscreen)
endfunction
command! -nargs=* -bang Rg call RipgrepFzf(<q-args>, <bang>0)
