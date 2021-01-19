let mapleader=" "

if empty(glob('~/.config/nvim/autoload/plug.vim'))
  silent !curl -fLo ~/.config/nvim/autoload/plug.vim --create-dirs
    \ https://raw.githubusercontent.com/junegunn/vim-plug/master/plug.vim
  "autocmd VimEnter * PlugInstall
  "autocmd VimEnter * PlugInstall | source $MYVIMRC
endif

" Use system clipboard
set clipboard+=unnamedplus

" -----Basic AutoCmd-----
" Fix tex file type set
autocmd BufRead,BufNewFile *.tex set filetype=tex
autocmd BufRead,BufNewFile /tmp/calcurse*,~/.calcurse/notes/* set filetype=markdown

autocmd FileType tex,latex,markdown setlocal spell spelllang=en_us

" Vertically center document when entering insert mode
autocmd InsertEnter * norm zz

" Remove trailing whitespace on save
autocmd BufWritePre * %s/\s\+$//e

" ------Standard Bindings------
" Basic file system commands
nnoremap <A-o> :!touch<Space>
nnoremap <A-e> :!crf<Space>
nnoremap <A-d> :!mkdir<Space>
nnoremap <A-m> :!mv<Space>%<Space>

" Fix Y behaviour
nmap Y y$

" Fix indenting visual block
vmap < <gv
vmap > >gv

" Enable and disable auto comment
map <leader>c :setlocal formatoptions-=cro<CR>
map <leader>C :setlocal formatoptions=cro<CR>

" Enable spell checking, s for spell check
map <leader>s :setlocal spell! spelllang=en_au<CR>

" Enable Disable Auto Indent
map <leader>i :setlocal autoindent<CR>
map <leader>I :setlocal noautoindent<CR>

" Shell check
map <leader>p :!clear && shellcheck %<CR>

" Compile and open output
map <leader>G :w! \| !comp <c-r>%<CR><CR>
map <leader>o :!opout <c-r>%<CR><CR>

" Shortcutting split navigation
map <A-h> <C-w>h
map <A-j> <C-w>j
map <A-k> <C-w>k
map <A-l> <C-w>l

" Tab shortcuts
nnoremap <A-p> :tabp<CR>
nnoremap <A-n> :tabn<CR>

" Alias replace all to
nnoremap <A-s> :%s//gI<Left><Left><Left>

" Alias write and quit to Q
nnoremap <leader>q :wq<CR>
nnoremap <leader>w :w<CR>

" Save file as sudo when no sudo permissions
cmap w!! w !sudo tee > /dev/null %

" -----Code Generation-----
" Guide navigation
noremap <leader><Tab> <Esc>/<++><Enter>"_c4l
inoremap <leader><Tab> <Esc>/<++><Enter>"_c4l
vnoremap <leader><Tab> <Esc>/<++><Enter>"_c4l

" general insert commands
inoremap ;g <++>

autocmd vimenter * hi Normal guibg=NONE ctermbg=NONE " transparent bg

if !exists('g:vscode')
  call plug#begin('~/.config/nvim/autoload/plugged')
  " Themes
  Plug 'vim-airline/vim-airline'
  Plug 'vim-airline/vim-airline-themes'
  Plug 'tomasiser/vim-code-dark'
  " Code Completion
  Plug 'neoclide/coc.nvim', {'branch': 'release'}
  " Tags
  Plug 'alvan/vim-closetag'
  Plug 'tpope/vim-surround'
	Plug 'mattn/emmet-vim'
  " Commenting
  Plug 'tpope/vim-commentary'
  " Syntax highlighting
  Plug 'HerringtonDarkholme/yats.vim'
  Plug 'yuezk/vim-js'
  Plug 'maxmellon/vim-jsx-pretty'
	Plug 'rust-lang/rust.vim'
	" Motions
	Plug 'easymotion/vim-easymotion'
	" Git
  Plug 'airblade/vim-gitgutter'
	Plug 'tpope/vim-fugitive'
	" Misc
  Plug 'junegunn/fzf.vim'
  Plug 'junegunn/goyo.vim'
  Plug 'rrethy/vim-hexokinase', { 'do': 'make hexokinase' }
	Plug 'vimwiki/vimwiki'
	Plug 'tpope/vim-repeat'
	Plug 'dhruvasagar/vim-table-mode'
	Plug 'relastle/bluewery.vim'
	Plug 'arzg/vim-colors-xcode'
  Plug 'flrnd/candid.vim'
	Plug 'joshdick/onedark.vim'
	Plug 'ryanoasis/vim-devicons'
	Plug 'preservim/nerdtree'
	call plug#end()

  " Basic settings

  set mouse=a
  syntax on
  set ignorecase
  set smartcase
  set encoding=utf-8
  set number relativenumber
  set termguicolors
  colorscheme  onedark
	au ColorScheme * hi Normal ctermbg=none guibg=none
	au ColorScheme myspecialcolors hi Normal ctermbg=red guibg=red

	" NERDTree
	nnoremap <leader>n :NERDTreeFocus<CR>
	nnoremap <C-n> :NERDTreeToggle<CR>
	nnoremap <C-f> :NERDTreeFind<CR>

  " Tab Settings
  set shiftwidth=2
  set softtabstop=2
  set tabstop=2

  " Autocompletion
  set wildmode=longest,list,full

  " Fix splitting
  set splitbelow splitright


	" Vim Wiki
	let g:vimwiki_list = [{'auto_diary_index': 1}]

	" Easy Motion
	map <leader><leader>. <Plug>(easymotion-repeat)
	map <leader><leader>f <Plug>(easymotion-overwin-f)
	map <leader><leader>j <Plug>(easymotion-overwin-line)
	map <leader><leader>k <Plug>(easymotion-overwin-line)
	map <leader><leader>w <Plug>(easymotion-overwin-w)

	" Emmet
	let g:user_emmet_leader_key='<A-c>'

	" Table mode
	let g:table_mode_delete_row_map = "<leader>tdr"

  " Goyo
  noremap <leader>g :Goyo<CR>

  " Git Gutter
  highlight GitGutterAdd guifg=#009900 ctermfg=Green
  highlight GitGutterChange guifg=#bbbb00 ctermfg=Yellow
  highlight GitGutterDelete guifg=#ff2222 ctermfg=Red
  nmap ) <Plug>(GitGutterNextHunk)
  nmap ( <Plug>(GitGutterPrevHunk)
  let g:gitgutter_enabled = 1
  let g:gitgutter_map_keys = 0
  let g:gitgutter_highlight_linenrs = 1

  " Vim-airline
  let g:airline#extensions#wordcount#enabled = 1
  let g:airline#extensions#hunks#non_zero_only = 1
  let g:airline_theme='onedark'

  " Vim Hexokinase
  let g:Hexokinase_refreshEvents = ['InsertLeave']

  let g:Hexokinase_optInPatterns = [
  \     'full_hex',
  \     'triple_hex',
  \     'rgb',
  \     'rgba',
  \     'hsl',
  \     'hsla',
  \     'colour_names'
  \ ]

  let g:Hexokinase_highlighters = ['backgroundfull']

  " Reenable hexokinase on enter
  autocmd VimEnter * HexokinaseTurnOn

  " ------Vim Auto Closetag------
  " filenames like *.xml, *.html, *.xhtml, ...
  " These are the file extensions where this plugin is enabled.
  let g:closetag_filenames = '*.html,*.xhtml,*.jsx,*.js,*.tsx'

  " filenames like *.xml, *.xhtml, ...
  " This will make the list of non-closing tags self-closing in the specified files.
  let g:closetag_xhtml_filenames = '*.xml,*.xhtml,*.jsx,*.js,*.tsx'

  " filetypes like xml, html, xhtml, ...
  " These are the file types where this plugin is enabled.
  let g:closetag_filetypes = 'html,xhtml,jsx,js,tsx'

  " filetypes like xml, xhtml, ...
  " This will make the list of non-closing tags self-closing in the specified files.
  let g:closetag_xhtml_filetypes = 'xml,xhtml,jsx,js,tsx'

  " integer value [0|1]
  " This will make the list of non-closing tags case-sensitive (e.g. `<Link>` will be closed while `<link>` won't.)
  let g:closetag_emptyTags_caseSensitive = 1

  " Disables auto-close if not in a "valid" region (based on filetype)
  let g:closetag_regions = {
      \ 'typescript.tsx': 'jsxRegion,tsxRegion',
      \ 'javascript.jsx': 'jsxRegion',
      \ }

  " Shortcut for closing tags, default is '>'
  let g:closetag_shortcut = '>'

  " Add > at current position without closing the current tag, default is ''
  let g:closetag_close_shortcut = '<leader>>'


  " ------COC SETTINGS------
  " prettier command for coc
  command! -nargs=0 Prettier :CocCommand prettier.formatFile
  let g:coc_global_extensions = [
    \ 'coc-snippets',
    \ 'coc-pairs',
    \ 'coc-prettier',
    \ 'coc-tsserver',
    \ 'coc-html',
    \ 'coc-css',
    \ 'coc-json',
    \ 'coc-angular',
    \ 'coc-vimtex'
    \ ]

  " From Coc Readme
  set updatetime=300

  " Some servers have issues with backup files, see #649
  set nobackup
  set nowritebackup

  " don't give |ins-completion-menu| messages.
  set shortmess+=c

  " always show signcolumns
  set signcolumn=yes
	set clipboard+=unnamedplus

  " Use tab for trigger completion with characters ahead and navigate.
  " Use command ':verbose imap <tab>' to make sure tab is not mapped by other plugin.
  inoremap <silent><expr> <TAB>
        \ pumvisible() ? "\<C-n>" :
        \ <SID>check_back_space() ? "\<TAB>" :
        \ coc#refresh()
  inoremap <expr><S-TAB> pumvisible() ? "\<C-p>" : "\<C-h>"

  function! s:check_back_space() abort
    let col = col('.') - 1
    return !col || getline('.')[col - 1]  =~# '\s'
  endfunction

  " Use <c-space> to trigger completion.
  inoremap <silent><expr> <c-space> coc#refresh()

  " Use <cr> to confirm completion, `<C-g>u` means break undo chain at current position.
  " Coc only does snippet and additional edit on confirm.
  inoremap <expr> <cr> pumvisible() ? "\<C-y>" : "\<C-g>u\<CR>"
  " Or use `complete_info` if your vim support it, like:
  " inoremap <expr> <cr> complete_info()["selected"] != "-1" ? "\<C-y>" : "\<C-g>u\<CR>"

  " Use `[g` and `]g` to navigate diagnostics
  nmap <silent> [g <Plug>(coc-diagnostic-prev)
  nmap <silent> ]g <Plug>(coc-diagnostic-next)

  " Remap keys for gotos
  nmap <silent> gd <Plug>(coc-definition)
  nmap <silent> gy <Plug>(coc-type-definition)
  nmap <silent> gi <Plug>(coc-implementation)
  nmap <silent> gr <Plug>(coc-references)

  function! s:show_documentation()
    if (index(['vim','help'], &filetype) >= 0)
      execute 'h '.expand('<cword>')
    else
      call CocAction('doHover')
    endif
  endfunction

  " Remap for rename current word
  nmap <rn> <Plug>(coc-rename)

  " Remap for format selected region
  xmap <leader>f  <Plug>(coc-format-selected)
  nmap <leader>f  <Plug>(coc-format-selected)

  augroup mygroup
    autocmd!
    " Setup formatexpr specified filetype(s).
    autocmd FileType typescript,json setl formatexpr=CocAction('formatSelected')
    " Update signature help on jump placeholder
    autocmd User CocJumpPlaceholder call CocActionAsync('showSignatureHelp')
  augroup end

  " Remap for do codeAction of selected region, ex: `<leader>aap` for current paragraph
  xmap <leader>a  <Plug>(coc-codeaction-selected)
  nmap <leader>a  <Plug>(coc-codeaction-selected)

  " Remap for do codeAction of current line
  nmap <leader>ac  <Plug>(coc-codeaction)
  " Fix autofix problem of current line
  nmap <leader>qf  <Plug>(coc-fix-current)

  " Create mappings for function text object, requires document symbols feature of languageserver.
  xmap if <Plug>(coc-funcobj-i)
  xmap af <Plug>(coc-funcobj-a)
  omap if <Plug>(coc-funcobj-i)
  omap af <Plug>(coc-funcobj-a)

  " Use `:Format` to format current buffer
  command! -nargs=0 Format :call CocAction('format')

  " Use `:Fold` to fold current buffer
  command! -nargs=? Fold :call     CocAction('fold', <f-args>)

  " use `:OR` for organize import of current buffer
  command! -nargs=0 OR   :call     CocAction('runCommand', 'editor.action.organizeImport')

  " Add status line support, for integration with other plugin, checkout `:h coc-status`
  set statusline^=%{coc#status()}%{get(b:,'coc_current_function','')}
	au ColorScheme * hi Normal ctermbg=none guibg=none
	au ColorScheme myspecialcolors hi Normal ctermbg=red guibg=red
endif


