call plug#begin()

" Intellisense
Plug 'neoclide/coc.nvim', {'branch': 'release'}

" Dir tree
Plug 'scrooloose/nerdtree'
Plug 'Xuyuanp/nerdtree-git-plugin'

" Typescript syntax
Plug 'HerringtonDarkholme/yats.vim'

" ReactJS JSX syntax highlighting
Plug 'mxw/vim-jsx'

" Generate JSDoc commands based on function signature
Plug 'heavenshell/vim-jsdoc'

" Status bar
Plug 'vim-airline/vim-airline'
Plug 'vim-airline/vim-airline-themes'

" Color Scheme
Plug 'dracula/vim', { 'as': 'dracula' }

" Function signatures
Plug 'Shougo/echodoc.vim'

" git diff
Plug 'mhinz/vim-signify'

" git utils
Plug 'tpope/vim-fugitive'

Plug 'ctrlpvim/ctrlp.vim'

call plug#end()

