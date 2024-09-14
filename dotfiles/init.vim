""" Editor
set number
set autoindent expandtab tabstop=2 shiftwidth=2
set mouse=


""" Plugins
call plug#begin()

" Theme
Plug 'tanvirtin/monokai.nvim'

" NERDTree
Plug 'preservim/nerdtree'
Plug 'Xuyuanp/nerdtree-git-plugin'
Plug 'ryanoasis/vim-devicons'
autocmd StdinReadPre * let s:std_in=1
autocmd VimEnter * NERDTree | if argc() > 0 || exists("s:std_in") | wincmd p | endif

" Git supports
Plug 'airblade/vim-gitgutter'

" fzf
Plug 'junegunn/fzf', { 'do': { -> fzf#install() } }
Plug 'junegunn/fzf.vim'

" Developments
Plug 'github/copilot.vim'

" Rails supports
Plug 'tpope/vim-rails'

call plug#end()


""" Themes
syntax on
colorscheme monokai_ristretto


""" Commands
command Rspec !bundle exec rspec %


""" Shortcuts
" fzf
map <C-N> <esc>:Files<CR>
map <C-F> <esc>:Rg<CR>

