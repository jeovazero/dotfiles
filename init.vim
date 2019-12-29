source ~/.config/nvim/plugins.vim

"""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""
""" GENERAL
set fileencoding=utf-8

" remap leader
let g:mapleader=','

" number column
set number

" Don't show last command
set noshowcmd

"" Tabs
" spaces in tab
set expandtab

" number of spaces
set softtabstop=2

" for indentation
set shiftwidth=2

" hightlight cursor line
set cursorline

" don't close buffers, just hide them
set hidden

" some lsp have issues with backup files
set nobackup
set nowritebackup

" tick time for diagnostic messages
set updatetime=100

" theme
set termguicolors
colorscheme dracula

" window switching
nmap <C-h> <C-w>h
nmap <C-j> <C-w>j
nmap <C-k> <C-w>k
nmap <C-l> <C-w>l

" buffer switching
noremap <leader>z :bp<CR>
noremap <leader>q :bp<CR>
noremap <leader>x :bn<CR>
noremap <leader>w :bn<CR>

" close buffer
noremap <leader>c :bd<CR>

" clean highlight search
nnoremap <leader><space> :noh<cr>

" tabs
nnoremap <Tab> gt
nnoremap <S-Tab> gT
nnoremap <silent> <S-t> :tabnew<CR>

" two lines for command line 
set cmdheight=2

" don't give |ins-completion-menu| messages.  For example,
""-- xxx completion (YYY)", \"match 1 of 2", \"The only match",
""Pattern not found", \"Back at original", etc.
set shortmess+=c

if exists("*fugitive#statusline")
  set statusline+=%{fugitive#statusline()}
endif

"""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""
""" COC config
let g:coc_global_extensions = [
	\'coc-tsserver',
	\'coc-tslint-plugin',
	\'coc-emoji',
	\'coc-json',
	\'coc-highlight',
	\'coc-css',
	\'coc-html'
	\]

" navigate in diagnostics
nmap <silent> db <Plug>(coc-diagnostic-prev)
nmap <silent> dn <Plug>(coc-diagnostic-next)

" coc gotos
nmap <silent> td <Plug>(coc-definition)
nmap <silent> tt <Plug>(coc-type-definition)
nmap <silent> ti <Plug>(coc-implementation)
nmap <silent> tr <Plug>(coc-references)

nmap <leader>rn <Plug>(coc-rename)
nmap <leader>rf <Plug>(coc-refactor)
nmap <leader>cl <Plug>(coc-codelens-action)

" ctrl + space to trigger completion
inoremap <silent><expr> <c-space> coc#refresh()
nmap <leader>qf  <Plug>(coc-fix-current)

nnoremap <silent> <leader>s :call <SID>show_documentation()<CR>

function! s:show_documentation()
  if (index(['vim','help'], &filetype) >= 0)
    execute 'h '.expand('<cword>')
  else
    call CocAction('doHover')
  endif
endfunction

" Use tab for trigger completion with characters ahead and navigate.
" Use command ':verbose imap <tab>' to make sure tab is not mapped by other
" plugin.
inoremap <silent><expr> <TAB>
      \ pumvisible() ? "\<C-n>" :
      \ <SID>check_back_space() ? "\<TAB>" :
      \ coc#refresh()
inoremap <expr><S-TAB> pumvisible() ? "\<C-p>" : "\<C-h>"

function! s:check_back_space() abort
  let col = col('.') - 1
  return !col || getline('.')[col - 1]  =~# '\s'
endfunction

"""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""
""" NerdTree

let g:NERDTreeShowHidden = 1

" custom arrows
let g:NERDTreeDirArrowExpandable = '▸'
let g:NERDTreeDirArrowCollapsible = '▾'

let g:NERDTreeWinSize = 30

nnoremap <silent> <F2> :NERDTreeFind<CR>
nnoremap <silent> <F3> :NERDTreeToggle<CR>

" auto close when the window open left is the nerdTree
autocmd bufenter * if (winnr("$") == 1 && exists("b:NERDTree") && b:NERDTree.isTabTree()) | q | endif

" open automatically
autocmd StdinReadPre * let s:std_in=1
autocmd VimEnter * if argc() == 1 && isdirectory(argv()[0]) && !exists("s:std_in") | exe 'NERDTree' argv()[0] | wincmd p | ene | exe 'cd '.argv()[0] | endif

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

"""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""
" CTRL + P
let g:ctrlp_map = '<c-p>'
let g:ctrlp_cmd = 'CtrlP'
let g:ctrlp_user_command = ['.git', 'cd %s && git ls-files -co --exclude-standard']
let g:ctrlp_use_caching = 1

"""""
" Airline
let g:airline_extensions = ['coc', 'hunks', 'branch']
let g:airline_highlighting_cache = 1
let g:airline#extensions#tabline#enabled = 1

let airline#extensions#coc#error_symbol = 'Error:'

let airline#extensions#coc#warning_symbol = 'Warning:'

let airline#extensions#coc#stl_format_err = '%E{[%e(#%fe)]}'

let airline#extensions#coc#stl_format_warn = '%W{[%w(#%fw)]}'

""""
" Echo doc
let g:echodoc_enable_at_startup = 1
