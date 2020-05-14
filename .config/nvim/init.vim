""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""

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


call plug#begin('~/.local/share/nvim/plugged')      " let vim-plug manage plugin, required

Plug 'dracula/vim'                    "colorscheme
Plug 'sheerun/vim-polyglot'           "syntax hightlight

"coc.nvim
Plug 'neoclide/coc.nvim', {'branch': 'release'}

Plug 'preservim/nerdcommenter'
Plug 'christoomey/vim-tmux-navigator' "navigating in tmux
Plug 'tpope/vim-surround'
Plug 'majutsushi/tagbar'

"Snippets
Plug 'SirVer/ultisnips'
Plug 'honza/vim-snippets'

"Fuzzy search
  Plug 'junegunn/fzf', { 'dir': '~/.fzf', 'do': './install --all' }
  Plug 'junegunn/fzf.vim'

"markdown
  "Plug 'junegunn/goyo.vim'
  "Plug 'tpope/vim-markdown'
Plug 'Glench/Vim-Jinja2-Syntax'
"Plug 'jalvesaq/nvim-r'

Plug 'lervag/vimtex'          "edit Latex
Plug 'haya14busa/is.vim'      "incremental search improved
Plug 'yggdroot/indentline'    "indent  line for vim
Plug 'sbdchd/neoformat'       "formatting

call plug#end()       " required

"""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""


" => Basic Settings
"""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""

let g:python3_host_prog = '/usr/local/bin/python3'

set autoread                                     " reload on external file changes
set backspace=indent,eol,start                   " backspace behaviour
set clipboard=unnamed,unnamedplus                " enable clipboard
set encoding=utf8                                " enable utf8 support
set hidden                                       " hide buffers, don't close
set mouse=a                                      " enable mouse support
set nowrap                                       " disable wrapping
set number                                       " show line numbers
set relativenumber
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


let g:dracula_italic = 0
colorscheme dracula                              " set colorscheme


hi Normal guibg=NONE ctermbg=NONE
hi! NonText ctermbg=NONE guibg=NONE guifg=NONE ctermfg=NONE

filetype plugin indent on


highlight Cursor guifg=white guibg=gray
highlight iCursor guifg=white guibg=steelblue

set statusline=
set statusline+=%#IncSearch#
set statusline+=\ %y
set statusline+=\ %r
set statusline+=%#CursorLineNr#
set statusline+=\ %F
set statusline+=%= "Right side settings
set statusline+=%#Search#
set statusline+=\ %l/%L
set statusline+=\ [%c]


"Performace Tuning
set autoindent expandtab                         " autoindentation & tabbing
set shiftwidth=2 softtabstop=2 tabstop=2         " 1 tab = 2 spaces
set hlsearch ignorecase incsearch smartcase      " search options

set nobackup noswapfile nowritebackup            " disable backup/swap files
set undofile undodir=~/.vim/undo undolevels=9999 " undo options

set lazyredraw                                   " enable lazyredraw
set nocursorline                                 " disable cursorline

" Make it obvious where 80 characters is
set textwidth=80
set colorcolumn=+1

set ttyfast                                      " enable fast terminal connection

set splitright splitbelow

""""""""""""""
"  Autocmnd  "
""""""""""""""

" F9 to run python, JS inside vim
autocmd FileType python map <buffer> <Leader>0 :w<CR>:exec '!python3' shellescape(@%, 1)<CR>
autocmd FileType javascript map <buffer> <Leader>0 <esc>:w<CR>:exec '!node' shellescape(@%, 1)<CR>


" Vertically center document when entering insert mode
autocmd InsertEnter * norm zz

" Remove trailing whitespace on save
autocmd BufWritePre * %s/\s\+$//e

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

xnoremap K :move '<-2<CR>gv-gv
xnoremap J :move '>+1<CR>gv-gv

"Search and replace using *
nnoremap <Leader>r :%s///g<Left><Left>
nnoremap <Leader>rc :%s///gc<Left><Left><Left>
xnoremap <Leader>r :s///g<Left><Left>
xnoremap <Leader>rc :s///gc<Left><Left><Left>
nnoremap <silent> s* :let @/='\<'.expand('<cword>').'\>'<CR>cgn
xnoremap <silent> s* "sy:let @/=@s<CR>cgn

" Enable spell checking, s for spell check
map <leader>s :setlocal spell! spelllang=en<CR>
map <leader>u :CocList snippets<CR>



" Switch between tabs
nnoremap <Leader>1 1gt
nnoremap <Leader>2 2gt
nnoremap <Leader>3 3gt


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
let g:neoformat_enabled_javascript = ['prettier']

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

""""""""""""
"  Tagbar  "
"
""""""""""""
map <leader>t :TagbarToggle<CR>


"""""""""
"  fzf  "
"""""""""

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

let g:vim_markdown_conceal = 0
let g:vim_markdown_conceal_code_blocks = 0
let g:vim_markdown_strikethrough = 1
let g:vim_markdown_new_list_item_indent = 2



"""""""""
"  COC  "
"""""""""

let g:coc_global_extensions = [
      \ 'coc-tsserver',
      \ 'coc-python',
      \ 'coc-pairs',
      "\ 'coc-emmet',
      \ 'coc-json',
      "\ 'coc-css',
      \ 'coc-vimtex'
      \]

set hidden
set nobackup
set nowritebackup
set cmdheight=2         " Give more space for displaying messages.
set updatetime=300
set shortmess+=c        " Don't pass messages to |ins-completion-menu|.
set signcolumn=yes

"tab completion
inoremap <silent><expr> <TAB>
      \ pumvisible() ? "\<C-n>" :
      \ <SID>check_back_space() ? "\<TAB>" :
      \ coc#refresh()
inoremap <expr><S-TAB> pumvisible() ? "\<C-p>" : "\<C-h>"

function! s:check_back_space() abort
  let col = col('.') - 1
  return !col || getline('.')[col - 1]  =~# '\s'
endfunction

"<CR> to confirm completion, use: >

	inoremap <expr> <cr> pumvisible() ? "\<C-y>" : "\<CR>"

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
let g:vimtex_fold_enabled = 0

" To prevent conceal in LaTeX files
let g:tex_conceal = ''
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
