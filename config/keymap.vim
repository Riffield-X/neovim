" 定义 leader
let mapleader=" "

" 光标移动——普通模式
"noremap j gj 
nnoremap k gk
noremap J 5j
noremap K 5k
noremap <C-y> 5<C-y>
noremap <C-e> 5<C-e>

" 光标移动——插入模式
inoremap <c-h> <left>
inoremap <c-j> <down>
inoremap <c-k> <up>
inoremap <c-l> <right>
inoremap <c-o> <esc>o
inoremap <M-o> <esc>O
inoremap <M-h> <HOME>
inoremap <M-l> <END>
inoremap <S-up> <esc>ddkPA
inoremap <S-down> <esc>ddpA
inoremap <M-b> <esc>gea
inoremap <M-e> <esc>ea

" 光标移动——命令行模式
cnoremap <M-h> <Home>
cnoremap <M-l> <End>
cnoremap <C-h> <left>
cnoremap <C-l> <right>
cnoremap <C-j> <down>
cnoremap <C-k> <up>
cnoremap <M-b> <S-left>
cnoremap <M-e> <S-right>

" 光标移动——visual模式
vnoremap j gj
vnoremap k gk

" 复制到末尾
nnoremap Y y$

" 复制——插入模式
" ctrl+d 复制粘贴一行——pycharm快捷键
inoremap <c-d> <esc>yypA
" 粘贴
inoremap <c-v> <esc>pa
" 保存
inoremap <c-s> <esc>:w<cr>

" 复制到剪贴板
vnoremap Y "+y

" 选中全文
noremap <C-a> ggVG
inoremap <C-a> <esc>ggVG

" 删除
inoremap <C-y> <esc>ddi
inoremap <C-e> <esc>ld$a
inoremap <C-b> <esc>ld0i
inoremap <C-u> <esc>ldei

" 撤销上一步操作
inoremap <C-z> <esc>ui

" 窗口相关快捷键
noremap <c-h> <C-w>h
noremap <c-j> <C-w>j
noremap <c-k> <C-w>k
noremap <c-l> <C-w>l
noremap ;h <c-w>H
noremap ;j <c-w>J
noremap ;k <c-w>K
noremap ;l <c-w>L
tnoremap <c-h> <c-\><c-n><c-w>h
tnoremap <c-j> <c-\><c-n><c-w>j
tnoremap <c-k> <c-\><c-n><c-w>k
tnoremap <c-l> <c-\><c-n><c-w>l

nnoremap <M-right> :vertical resize +5<CR>
nnoremap <M-left> :vertical resize -5<CR>
nnoremap <M-up> :resize +5<CR>
nnoremap <M-down> :resize -5<CR>

" 分割窗口
nnoremap sk :abo split<CR>
nnoremap sj :rightbelow split<cr>
nnoremap sh :abo vsplit<CR>
nnoremap sl :rightbelow vsplit<cr>

" 切换窗口割模式
nnoremap <leader>v <C-w>t<C-w>H
nnoremap <leader>h <C-w>t<C-w>K

" 关闭窗口
nnoremap <silent> q <esc>:close<cr>
vnoremap <silent> q <esc>:close<cr>

" 关闭搜索颜色
nnoremap <BackSpace> :nohl<cr>

" 重新加载配置
noremap R :source $MYVIMRC<CR>

" jk表示esc
inoremap jk <esc>

" 代码缩进，加_ 速度更快
nmap << <<_
nmap >> >>_

" 新建终端
" nnoremap <leader>tt :terminal<cr>
nnoremap <leader>tt :set splitbelow<CR>:split<CR>:res +10<CR>:term<CR>

" 主题更换
noremap <leader>th :Colors<CR>

" 运行程序
map <c-r> :call CompileRunGcc()<CR>
inoremap <c-r> <esc>:call CompileRunGcc()<CR>

" 使用alt q执行宏录制功能
nnoremap <M-q> q
" 保存并退出
nnoremap Q :wq<cr>
noremap <silent> <space><space> <esc>:silent! write<cr>
xnoremap <silent> <space><space> <esc>:silent! write<cr>

" 使用回车打开关闭折叠
nnoremap <CR> za
" shift enter，为何不可以？
nnoremap <S-Return> zMzo

nnoremap ! :!

" 跳转到最后
" 0是跳转到开头
nnoremap 9 g_

augroup vime_keymap_group
    autocmd!
    " 使用esc退出终端
    if has('nvim')
        au TermOpen term://* tnoremap <buffer> <Esc> <c-\><c-n> " | startinsert
        " au BufEnter term://* startinsert
    else
        au TerminalOpen term://* tnoremap <buffer> <Esc> <C-\><C-n> " | startinsert
        " au BufEnter term://* startinsert
    endif
augroup END

function! s:writeCurrent() abort
    if !&readonly && &buftype =~# '^\%(acwrite\)\=$' && expand('%') !=# ''
        silent write
    endif
endfunction

" 标签
nnoremap <silent> <leader>tn :tabnew<cr>
nnoremap <silent> <leader>tc :tabclose<cr>
nnoremap <silent> <M-L> :tabmove +1<cr>
nnoremap <silent> <M-H> :tabmove -1<cr>
tnoremap <silent> <M-L> <c-\><c-n>:tabmove +1<cr>
tnoremap <silent> <M-H> <c-\><c-n>:tabmove -1<cr>

" 使用系统应用打开当前buffer文件
noremap <silent> <M-x> :call common#functions#OpenFileUsingSystemApp(expand('%:p'))<cr>

" 对齐
xmap ga <Plug>(EasyAlign)
nmap ga <Plug>(EasyAlign)

" 加载 markdown 快捷键配置
exec 'source ' . g:plugins_config_root_path . 'md-snippets.vim'

func! CompileRunGcc()
	exec "w"
	if &filetype == 'c'
		exec "!g++ % -o %<"
		exec "!time ./%<"
	elseif &filetype == 'cpp'
		set splitbelow
		exec "!g++ -std=c++11 % -Wall -o %<"
		:sp
		:res -15
		:term ./%<
	elseif &filetype == 'java'
		set splitbelow
		:sp
		:res -5
		term javac % && time java %<
	elseif &filetype == 'sh'
		:!time bash %
	elseif &filetype == 'python'
		set splitbelow
		:sp
		:term python3 %
	elseif &filetype == 'html'
		silent! exec "!".g:mkdp_browser." % &"
	elseif &filetype == 'markdown'
		"exec "InstantMarkdownPreview"
		exec "MarkdownPreview"
	elseif &filetype == 'tex'
		silent! exec "VimtexStop"
		silent! exec "VimtexCompile"
	elseif &filetype == 'dart'
		exec "CocCommand flutter.run -d ".g:flutter_default_device." ".g:flutter_run_args
		silent! exec "CocCommand flutter.dev.openDevLog"
	elseif &filetype == 'javascript'
		set splitbelow
		:sp
		:term export DEBUG="INFO,ERROR,WARNING"; node --trace-warnings .
	elseif &filetype == 'go'
		set splitbelow
		:sp
		:term go run .
	endif
endfunc

"if !common#functions#HasPlug('vim-airline') && !common#functions#HasPlug('vim-crystalline')
"    nnoremap  <M-l> :call common#functions#MoveTabOrBuf(1)<cr>
"    nnoremap  <M-h> :call common#functions#MoveTabOrBuf(0)<CR>
"    tnoremap  <M-l> <c-\><c-n>:call common#functions#MoveTabOrBuf(1)<cr>
"    tnoremap  <M-h> <c-\><c-n>:call common#functions#MoveTabOrBuf(0)<CR>
"endif
