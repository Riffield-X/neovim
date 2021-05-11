" 起始界面
Plug 'mhinz/vim-startify'

" 补全
Plug 'neoclide/coc.nvim', { 'branch': 'release' }

" 代码段
Plug 'honza/vim-snippets'

" 检索
Plug 'junegunn/fzf', { 'do': {-> fzf#install()} }
Plug 'junegunn/fzf.vim'
Plug 'Yggdroot/LeaderF', { 'do': ': LeaderfInstallCExtension ' }
Plug 'fszymanski/fzf-gitignore', {'do': ':UpdateRemotePlugins'}

" git 插件
Plug 'airblade/vim-gitgutter'
Plug 'tpope/vim-fugitive', {'on': ['Gwrite', 'Gcommit', 'Gread', 'Gdiff', 'Gblame']}

" undo Tree
Plug 'mbbill/undotree'

" markdown
Plug 'suan/vim-instant-markdown', {'for': 'markdown'}
Plug 'dhruvasagar/vim-table-mode', { 'on': 'TableModeToggle', 'for': ['text', 'markdown', 'vim-plug'] }
Plug 'mzlogin/vim-markdown-toc', { 'for': ['gitignore', 'markdown', 'vim-plug'] }
Plug 'dkarter/bullets.vim'

" 注释插件
Plug 'preservim/nerdcommenter'

" 生成注释文档
Plug 'kkoomen/vim-doge', {'do': {-> doge#install()}}

" debugger
Plug 'puremourning/vimspector', {'do': './install_gadget.py --enable-c --enable-python --enable-go'}

" 笔记插件，支持markdown
Plug 'vimwiki/vimwiki'

" 折叠插件
Plug 'pseewald/vim-anyfold', {'on': 'AnyFoldActivate'}

" 快速包围
Plug 'tpope/vim-surround'

" 全局替换插件
Plug 'brooth/far.vim'

" 翻译插件
Plug 'iamcco/dict.vim', {'on':
    \ [
    \ '<Plug>DictSearch', '<Plug>DictVSearch', '<Plug>DictWSearch',
    \ '<Plug>DictWVSearch', '<Plug>DictRSearch', '<Plug>DictRVSearch'
    \ ]}

" vim中文文档
" Plug 'yianwillis/vimcdoc'
" if has('nvim')
"     Plug 'nvim-treesitter/nvim-treesitter', {'do': ':TSUpdate'}
"     Plug 'nvim-treesitter/nvim-treesitter-textobjects'
"     Plug 'nvim-treesitter/nvim-treesitter-refactor'
"     Plug 'romgrk/nvim-treesitter-context'
" else
"     Plug 'sheerun/vim-polyglot'
"     Plug 'octol/vim-cpp-enhanced-highlight'
" endif

" 查看启动时间
Plug 'dstein64/vim-startuptime', {'on':'StartupTime'}
" 专注阅读
Plug 'junegunn/goyo.vim', { 'on': 'Goyo', 'for': 'markdown' }

" 忘记sudo?使用sudowrite或sw
Plug 'lambdalisue/suda.vim'

" 多光标
Plug 'mg979/vim-visual-multi'

" 悬浮终端
Plug 'voldikss/vim-floaterm', {'on': ['FloatermNew', 'FloatermToggle']}

" 函数列表
Plug 'liuchengxu/vista.vim', {'on': ['Vista!!', 'Vista']}

" 自动补全括号
"plug 'jiangmiao/auto-pairs'
"plug 'Yggdroot/hiPairs'

" 对齐
Plug 'junegunn/vim-easy-align', {'on': ['EasyAlign', '<Plug>(EasyAlign)']}
" 对齐线
Plug 'Yggdroot/indentLine', {'on': 'IndentLinesEnable'}


" 主题插件
Plug 'sainnhe/sonokai'
Plug 'lewis6991/moonlight.vim'
Plug 'arzg/vim-colors-xcode'
Plug 'sainnhe/edge'
Plug 'Mcmartelle/vim-monokai-bold'
Plug 'flrnd/candid.vim'
Plug 'rafalbromirski/vim-aurora'
Plug 'lithammer/vim-eighties'
Plug 'Nequo/vim-allomancer'
Plug 'connorholyday/vim-snazzy'
Plug 'Siphalor/vim-atomified'
Plug 'Jimeno0/vim-chito'
Plug 'ajmwagar/vim-deus'
Plug 'easysid/mod8.vim'
Plug 'Konstruktionist/vim'
Plug 'chrisdiana/itg_flat_vim'
Plug 'vim-scripts/desertEx'
Plug 'davidklsn/vim-sialoquent'

" coc 插件列表
let g:coc_global_extensions = [
	\ 'coc-ci',
	\ 'coc-clangd',
	\ 'coc-cmake',
	\ 'coc-diagnostic',
	\ 'coc-explorer',
	\ 'coc-json',
	\ 'coc-just-complete',
	\ 'coc-lists',
	\ 'coc-marketplace',
	\ 'coc-pyright',
	\ 'coc-jedi',
	\ 'coc-sh',
	\ 'coc-snippets',
	\ 'coc-vimlsp',
	\ 'coc-word',
	\ 'coc-yank']
