" 初始化一些全局变量
call common#common#init()

" 定义载入配置命令
command! -nargs=1 LoadScript exec 'source ' . g:config_root_path . '<args>'

" 让配置变更立即生效(好像没效果)
autocmd! BufWritePost $MYVIMRC source $MYVIMRC

" 载入基础配置
LoadScript base.vim

" 载入快捷键配置
LoadScript keymap.vim

" vim-plug 载入插件
call plug#begin(get(g:, 'plugins_install_path','~/.config/nvim/plugged'))
LoadScript plugin_list.vim
call plug#end()

" 载入主题配置
LoadScript theme/theme.vim
LoadScript theme/statusline.vim
LoadScript theme/tabline.vim

" 更新插件时自动安装或最开始配置时
function! PluginListUpdate()
	let filestamp = g:config_root_path . "plugin_list.vim"
	let timecha = localtime() - getftime(filestamp)
	if timecha <= 300 || empty(glob('~/.config/nvim/plugged'))
		autocmd VimEnter * PlugInstall --sync | source $MYVIMRC
	endif
endfunction

"call PluginListUpdate()

" 依据插件名字载入对应的插件配置
function s:source_config(plugName) abort
	let l:config_path = g:plugins_config_root_path . a:plugName . ".vim"
	if filereadable(l:config_path)
		exec 'source' fnameescape(l:config_path)
	endif
endfunction

" 载入插件配置
for [plugName, _] in items(g:plugs)
	if common#functions#HasInstall(plugName)
		call s:source_config(plugName)
	endif
endfor

" 避免每次开启后，之前搜索的内容还被高亮
exec "nohlsearch"
