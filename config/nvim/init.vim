source ~/.config/nvim/plugins.vim

" Section General {{{

" Abbreviations
abbr funciton function
abbr teh the
abbr tempalte template
abbr fitler filter
abbr cosnt const
ca Ag Ag!

set autoread                " detect when a file is changed

set history=1000            " change history to 1000
set textwidth=120

set backupdir=~/.vim-tmp,~/.tmp,~/tmp,/var/tmp,/tmp
set directory=~/.vim-tmp,~/.tmp,~/tmp,/var/tmp,/tmp

let g:python_host_prog = '/usr/bin/python'
let g:python3_host_prog = '/usr/bin/python3'

" set inccommand=nosplit

" }}}

" Section User Interface {{{

" switch cursor to line when in insert mode, and block when not
set guicursor=n-v-c:block,i-ci-ve:ver25,r-cr:hor20,o:hor50
  \,a:blinkwait700-blinkoff400-blinkon250-Cursor/lCursor
  \,sm:block-blinkwait175-blinkoff150-blinkon175

" enable 24 bit color support if supported
if (has('mac') && has("termguicolors"))
    set termguicolors
endif

syntax on
set background=dark
colorscheme base16-oceanicnext " Set the colorscheme

set number                  " show line numbers
set relativenumber          " show relative line numbers

set nowrap                  " now rap

set autoindent              " automatically set indent of new line
set smartindent

" toggle invisible characters
set list
set listchars=tab:→\ ,eol:¬,trail:⋅,extends:❯,precedes:❮
set showbreak=↪

" let g:tsuquyomi_disable_quickfix = 1

" highlight conflicts
match ErrorMsg '^\(<\|=\|>\)\{7\}\([^=].\+\)\?$'

" make backspace behave in a sane manner
set backspace=indent,eol,start

" Spell check
" set spell

" Tab control
set expandtab               " insert tabs rather than spaces for <Tab>
set smarttab                " tab respects 'tabstop', 'shiftwidth', and 'softtabstop'
set tabstop=4               " the visible width of tabs
set shiftwidth=4            " number of spaces to use for indent and unindent
set shiftround              " round indent to a multiple of 'shiftwidth'
set completeopt+=longest

" code folding settings
set foldmethod=syntax       " fold based on indent
set foldnestmax=10          " deepest fold is 10 levels
set nofoldenable            " don't fold by default
set foldlevel=1

set clipboard=unnamed

set ttyfast                 " faster redrawing
set diffopt+=vertical
set laststatus=2            " show the satus line all the time
set so=7                    " set 7 lines to the cursors - when moving vertical
set wildmenu                " enhanced command line completion
set hidden                  " current buffer can be put into background
set showcmd                 " show incomplete commands
set noshowmode              " don't show which mode disabled for PowerLine
set wildmode=list:longest   " complete files like a shell
set scrolloff=3             " lines of text around cursor
set shell=$SHELL
set cmdheight=1             " command bar height
set title                   " set terminal title

" Searching
set ignorecase              " case insensitive searching
set smartcase               " case-sensitive if expresson contains a capital letter
set hlsearch!               " highlight search results
set incsearch               " set incremental search, like modern browsers
set nolazyredraw            " don't redraw while executing macros

set magic                   " Set magic on, for regex

set showmatch               " show matching braces
set mat=2                   " how many tenths of a second to blink

set cursorline              " highlight cursor line

" error bells
set noerrorbells
set visualbell
set t_vb=
set tm=500

if has('mouse')
	set mouse=a
	" set ttymouse=xterm2
endif

" }}}

" Section Mappings {{{

" set a map leader for more key combos
let mapleader = ','

" remap esc
inoremap jk <esc>
inoremap eu <esc>

" wipout buffer
nmap <silent> <leader>b :bw<cr>

" shortcut to save
nmap <leader>w :w<cr>

" set paste toggle
" set pastetoggle=<leader>v

" toggle paste mode
" map <leader>v :set paste!<cr>

" edit ~/.config/nvim/init.vim
nnoremap <leader>ev :vsp $MYVIMRC<cr>
" edit zsh convig
nnoremap <leader>ez :vsp ~/.zshrc<cr>

" save current session
nnoremap <leader>s :mksession!<cr>

" clear highlighted search
" noremap <space> :set hlsearch! hlsearch?<cr>

" activate spell-checking alternatives
nmap ;s :set invspell spelllang=en<cr>

" markdown to html
nmap <leader>md :%!markdown --html4tags <cr>

" remove extra whitespace
nmap <leader><space> :%s/\s\+$<cr>
nmap <leader><space><space> :%s/\n\{2,}/\r\r/g<cr>


nmap <leader>l :set list!<cr>

" json format
nmap <leader>jf :call functions#JsonFormat()<cr>
nmap <leader>xf :call functions#XmlFormat()<cr>

" switch between current and last buffer
nmap <leader>. <c-^>

" enable . command in visual mode
vnoremap . :normal .<cr>

" map <silent> <C-h> :wincmd h<cr>
" map <silent> <C-j> :wincmd j<cr>
" map <silent> <C-k> :wincmd k<cr>
" map <silent> <C-l> :wincmd l<cr>
let g:tmux_navigator_no_mappings = 1

lua << EOL
local map = vim.api.nvim_set_keymap
local opts = { noremap = true, silent = true }

map('n', "<C-h>", "<CMD>lua require('Navigator').left()<CR>", opts)
map('n', "<C-k>", "<CMD>lua require('Navigator').up()<CR>", opts)
map('n', "<C-l>", "<CMD>lua require('Navigator').right()<CR>", opts)
map('n', "<C-j>", "<CMD>lua require('Navigator').down()<CR>", opts)
EOL

map <leader>wc :wincmd q<cr>

" toggle cursor line
nnoremap <leader>i :set cursorline!<cr>

" scroll the viewport faster
nnoremap <C-e> 3<C-e>
nnoremap <C-y> 3<C-y>

" moving up and down work as you would expect
nnoremap <silent> j gj
nnoremap <silent> k gk
nnoremap <silent> ^ g^
nnoremap <silent> $ g$

" search for word under the cursor
nnoremap <leader>/ "fyiw :/<c-r>f<cr>

" inoremap <tab> <c-r>=Smart_TabComplete()<CR>

map <leader>r :call RunCustomCommand()<cr>
" map <leader>s :call SetCustomCommand()<cr>
let g:silent_custom_command = 0

" helpers for dealing with other people's code
nmap \t :set ts=4 sts=4 sw=4 noet<cr>
nmap \s :set ts=4 sts=4 sw=4 et<cr>

nnoremap <silent> <leader>u :call functions#HtmlUnEscape()<cr>

" }}}

" Section AutoGroups {{{
" file type specific settings
augroup configgroup
    autocmd!

    " automatically resize panes on resize
    autocmd VimResized * exe 'normal! \<c-w>='

    " autocmd BufNewFile,BufReadPost *.md set filetype=markdown
    " let g:markdown_fenced_languages = ['css', 'javascript', 'js=javascript', 'json=javascript', 'stylus', 'html']

    " autocmd! BufEnter * call functions#ApplyLocalSettings(expand('<afile>:p:h'))

    " autocmd BufNewFile,BufRead,BufWrite *.md syntax match Comment /\%^---\_.\{-}---$/

    " set filetypes as typescript.jsx
    autocmd BufNewFile,BufRead *.tsx set filetype=typescript.tsx
    " autocmd BufNewFile,BufRead *.ts setlocal filetype=typescript
augroup END

" }}}

" Section Plugins {{{
let g:localvimrc_ask = 0
let g:localvimrc_sandbox = 0

" Remap keys for applying codeAction to the current line.
nmap <leader>ac  <Plug>(coc-codeaction)
" Apply AutoFix to problem on the current line.
nmap <leader>qf  <Plug>(coc-fix-current)
" GoTo code navigation.
nmap <silent> gd <Plug>(coc-definition)
nmap <silent> gy <Plug>(coc-type-definition)
nmap <silent> gi <Plug>(coc-implementation)
nmap <silent> gr <Plug>(coc-references)

" Use <leader>gt to show documentation in preview window
nnoremap <silent> <leader>gt :call <SID>show_documentation()<CR>

function! s:show_documentation()
  if (index(['vim','help'], &filetype) >= 0)
    execute 'h '.expand('<cword>')
  else
    call CocAction('doHover')
  endif
endfunction

map  / <Plug>(easymotion-sn)
omap / <Plug>(easymotion-tn)

map  n <Plug>(easymotion-next)
map  N <Plug>(easymotion-prev)


" Toggle NERDTree
map <silent> <C-\> :NERDTreeToggle<CR>
" expand to the path of the file in the current buffer
nmap <silent> <leader>y :NERDTreeFind<cr>

let NERDTreeShowHidden = 1
" let NERDTreeDirArrowExpandable = '▷'
" let NERDTreeDirArrowCollapsible = '▼'
let g:NERDTreeGlyphReadOnly = "RO"

let g:EasyMotion_smartcase = 1
let g:gitgutter_realtime = 1
let g:gitgutter_eager = 1

" FZF
"""""""""""""""""""""""""""""""""""""
let g:fzf_layout = { 'down': '~25%' }


if isdirectory(".git")
    " if in a git project, use :GFiles
    nmap <silent> <C-p> :GFiles<cr>
else
    " otherwise, use :FZF
    nmap <silent> <C-p> :FZF<cr>
endif

nmap <silent> <leader>r :Buffers<cr>
nmap <silent> <leader>e :FZF<cr>


" Fugitive Shortcuts
"""""""""""""""""""""""""""""""""""""
nmap <silent> <leader>gs :Git<cr>
" nmap <leader>ge :Gedit<cr>
" nmap <silent><leader>gr :Gread<cr>
nmap <silent><leader>gb :Git blame<cr>

nmap <leader>inc <C-a>

let g:user_emmet_settings = {
\   'javascript.jsx': {
\       'extends': 'jsx',
\   },
\ }

" airline options
let g:airline_powerline_fonts=1
let g:airline_detect_spell=0
" let g:airline_left_sep=''
" let g:airline_right_sep=''
let g:airline_theme='dark'
let g:airline#extensions#tabline#enabled = 1 " enable airline tabline
let g:airline#extensions#tabline#tab_min_count = 2 " only show tabline if tabs are being used (more than 1 tab open)
let g:airline#extensions#tabline#show_buffers = 0 " do not show open buffers in tabline
let g:airline#extensions#tabline#show_splits = 0
let g:airline_section_y = ''
let g:airline_section_z = ''

" don't hide quotes in json files
let g:vim_json_syntax_conceal = 0

let g:SuperTabCrMapping = 0

" delimitmMate
let delimitMate_expand_cr = 1
let delimitMate_expand_space = 1
let delimitMate_backspace = 1
let delimitMate_balance_matchpairs = 1

" indentLine
" let g:indentLine_color_term = 239
" let g:indentLine_char = "→"
" let g:indentLine_concealcursor=0

" function! Formatonsave()
"   let l:formatdiff = 1
"   pyf ~/llvm/tools/clang/tools/clang-format/clang-format.py
" endfunction
" autocmd BufWritePre *.h,*.cc,*.cpp call Formatonsave()


" CoC extensions
let g:coc_global_extensions = ['coc-tsserver']

" }}}

" vim:foldmethod=marker:foldlevel=0
