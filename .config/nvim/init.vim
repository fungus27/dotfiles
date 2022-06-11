" plugins
call plug#begin()
Plug 'prabirshrestha/vim-lsp'
Plug 'jackguo380/vim-lsp-cxx-highlight'
Plug 'junegunn/fzf', { 'do': { -> fzf#install() } }
Plug 'junegunn/fzf.vim'
Plug 'morhetz/gruvbox'
Plug 'savq/melange'
Plug 'cocopon/iceberg.vim'
Plug 'skywind3000/asyncrun.vim'
Plug 'mhinz/vim-startify'
Plug 'tpope/vim-fugitive'
Plug 'simeji/winresizer'
Plug 'ptzz/lf.vim'
Plug 'voldikss/vim-floaterm'
Plug 'sainnhe/gruvbox-material'
" Plug 'vim-airline/vim-airline'
call plug#end()


" custom functions
fun! ReadMan()
		" Assign current word under cursor to a script variable:
		let s:man_word = input("man page for: ")
		" Open a new window:
		:exe ":100vnew"
		" Read in the manpage for man_word (col -b is for formatting):
		:exe ":r!man 3 " . s:man_word . " | col -b"
		" Goto first line...
		:exe ":goto"
		" and delete it:
		:exe ":delete"
        " finally set file type to 'man':
        :exe ":set filetype=man"
endfun

function DelTrailWs() abort
    normal mz
    %s/\v\s+$//ge
    normal `z
endfunc


" floatterm
let g:floaterm_title = ""
let g:floaterm_borderchars = ""
hi FloatermBorder guibg=bg guifg=bg

" lf.vim
let g:lf_map_keys = 0
let g:lf_replace_netrw = 1

" lsp
if executable('ccls')
		au User lsp_setup call lsp#register_server({
								\ 'name': 'ccls',
								\ 'cmd': {server_info->['ccls']},
								\ 'root_uri': {server_info->lsp#utils#path_to_uri(lsp#utils#find_nearest_parent_file_directory(lsp#utils#get_buffer_path(), 'compile_commands.json'))},
								\ 'initialization_options': {'cache': {'directory': expand('~/.cache/ccls') }, 'highlight': { 'lsRanges': v:true}},
								\ 'allowlist': ['c', 'cpp', 'objc', 'objcpp', 'cc', 'h'], 
								\ })
endif
let g:lsp_diagnostics_enabled = 0
let g:lsp_document_highlight_enabled = 0
let g:lsp_completion_documentation_enabled = 0
let g:lsp_document_code_action_signs_enabled = 0 "disable wierd A>
let g:lsp_signature_help_enabled = 0 "life saver


" lightline
" let g:lightline = {
" 						\ 'colorscheme': 'powerline',
" 						\ }

" fzf
let g:fzf_layout = { 'down': '30%' }
let g:fzf_action = {
  \ 'ctrl-t': 'tab split',
  \ 'ctrl-s': 'below split',
  \ 'ctrl-v': 'below vsplit' }
command -nargs=? FilesGlob call fzf#vim#files(<q-args>, fzf#vim#with_preview({ 'source': 'getdirfiles f'}))


" asyncrun
let g:asyncrun_rootmarks = ['Makefile', 'makefile', '.git', '.root', '.project'] 
let g:asyncrun_open = 12 


" winresizer
let g:winresizer_start_key = '<leader>vr' 


" startify
let g:startify_custom_header =<<EOF
⠀⠀⠀⠀⠀⠀⠀⢠⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⢀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⢦⠀⠀⠀⠀⠀⠀⠀⠀
⠀⠀⠀⠀⠀⠀⠀⠸⣆⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⡰⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠘⡆⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⡰⠀⠀⠀⠀⠀⠘⡀⠀⠀⠀⠀⠀⠀⠀
⠀⠀⠀⠀⠀⠀⠀⠀⠹⣆⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⡇⠀⠀⠀⢀⠀⠀⠀⠀⠀⠀⠀⠀⣿⡀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⢠⠀⠀⠀⠀⠀⡇⠀⠀⠀⠀⠀⠀⡇⠀⠀⠀⠀⠀⠀⠀
⠀⠀⠀⠀⠀⠀⠀⠀⠀⣿⠀⠀⠀⠀⠀⠀⠀⠀⢸⠀⠀⠀⠀⠀⢠⡇⠀⠀⠀⢸⡆⠀⠀⠀⠀⠀⠀⠀⣿⡇⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⣼⡞⠀⠀⠀⠀⢀⡇⠀⠀⠀⠀⠀⠀⡇⢠⠀⠀⠀⠀⠀⠀
⠀⠀⢠⠀⠀⠀⠀⠀⢸⣿⡀⠀⠀⠀⠀⠀⠀⠀⣼⠀⠀⠀⠀⠀⣿⠀⠀⠀⠀⢸⣷⠀⠀⠀⠀⠀⠀⠀⢸⣿⡀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⣿⡇⠀⠀⠀⠀⣿⠀⠀⠀⠀⠀⠀⠐⣷⣸⡀⠀⠀⠀⠀⠀
⠀⠀⠈⡆⠀⠀⠀⠀⢸⣿⠇⠀⠀⠀⠀⠀⠀⠀⣿⡀⠀⠀⠀⢸⣿⠀⠀⠀⠀⠀⣿⣆⠀⠀⠀⠀⠀⠀⢸⣿⡇⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⢀⣴⡶⢞⣿⡀⠀⠀⠀⢸⣿⠀⠀⠀⠀⢀⡆⠀⣿⣿⡇⠀⠀⠀⠀⠀
⢠⣀⢀⣷⠀⠀⠀⠀⣸⣿⠀⠀⠀⠀⢀⣀⣤⡴⣿⠃⠀⠀⠀⢸⣿⠀⠀⠀⠀⣦⣿⡿⠀⠀⠀⠀⠀⠀⢸⣿⠁⠀⠀⠀⠀⠀⠀⠀⠀⠀⣠⣾⡿⡿⠀⠘⣿⠃⠀⠀⠀⢸⣿⠀⠀⠀⠀⠸⣧⠀⠈⣿⠃⠀⠀⠀⠀⠀
⠀⠙⢿⣿⣿⣦⣤⣴⣿⣧⣶⣶⣾⣿⣿⣿⠿⣷⡹⣧⠀⠀⠀⠀⢿⣧⡀⠀⠀⣸⡿⠁⠀⠀⠀⠀⠀⠀⢸⣯⠀⠀⠀⠀⠀⠀⠀⠀⣠⣾⣿⡏⠁⡇⠀⠀⠻⣧⠀⠀⠀⠀⢿⣧⠀⠀⠀⠀⢹⣷⣴⣿⠀⠀⠀⠀⠀⠀
⠀⠀⠀⣿⣿⡇⠉⠙⣿⣿⠛⠁⠀⢹⣼⡇⠀⣬⡣⣿⠀⠀⠀⠀⠘⣿⡇⠀⠀⣿⡇⠀⠀⠀⠀⢀⣀⣀⣼⣿⡄⠀⠀⠀⠀⠀⢠⣾⡿⢿⣿⡇⠀⠃⠀⣤⠀⣿⠀⠀⠀⠀⠘⣿⠀⠀⠀⠀⣼⣿⣿⣿⠀⠀⠀⠀⠀⠀
⠀⠀⠀⣿⠿⣷⠀⠀⣿⣿⠀⠀⠀⠈⣿⠁⠀⣿⣇⣿⠀⠀⠀⠠⢤⣿⡷⣦⣤⣿⠇⠀⠀⠀⠀⠈⠉⠙⢻⣿⡇⠀⠀⠀⡆⢠⣾⡿⠁⠀⣿⣷⠀⠀⠀⢿⣆⣿⠀⠀⠀⠀⢀⣿⠀⠀⠀⢠⣿⣿⣿⣿⣦⡀⠀⠀⠀⠀
⠀⠀⢸⡏⠀⣿⡄⠀⢻⣿⡆⠀⠀⠀⠻⡇⠀⣿⣿⡏⠀⠀⠀⠀⠘⣿⣖⠚⣿⣿⠀⠀⠀⠀⠀⠀⠀⠀⢸⣿⠃⠀⠀⠀⣿⣾⡿⠀⠀⠀⢸⣿⡄⠀⠀⣼⣿⡏⠀⠀⠀⠀⠘⣿⡄⠀⠀⣾⡿⠁⠀⠹⣿⣿⡆⠀⠀⠀
⠀⠀⠀⠃⠀⣿⠁⠀⣶⢿⣿⡀⠀⠀⠀⡇⢠⣿⡿⠀⠀⠀⠀⠀⠀⣸⣿⡀⢹⣿⣷⣤⡴⠁⠀⠀⠀⠀⣾⡿⠀⠀⠀⠀⣿⣿⠇⠀⠀⠀⠘⣿⠇⠀⢠⣿⡿⠀⠀⠀⠀⠀⠀⣸⣷⡀⢸⣿⠃⠀⠀⠀⣿⣿⠀⠀⠀⠀
⠀⠀⠀⠀⠀⣿⠀⠰⠃⣿⡿⠁⠀⠀⠀⠇⣿⢿⡇⠀⠀⠀⠀⠀⠀⢹⣿⡇⠘⣿⣿⠿⣷⡀⠀⠀⠀⠀⣿⡇⠀⠀⠀⠀⣿⣿⠀⠀⠀⠀⣸⠃⠀⠀⣿⢿⠃⠀⠀⠀⠀⠀⠀⢹⣿⡇⣾⡟⠀⠀⠀⠀⣿⣿⠀⠀⠀⠀
⠀⠀⠀⠀⠀⡇⠀⠀⣰⣿⡅⠀⠀⠀⠀⠀⣿⣀⡇⠀⠀⠀⠀⠀⠀⣾⣿⠃⠀⣿⣿⠀⠙⣿⣤⡀⠀⢠⣿⡇⠀⠀⠀⣸⣿⡇⠀⠀⠀⠀⡟⠀⠀⠀⣿⣸⠀⠀⠀⠀⠀⠀⠀⣾⣿⠃⣿⣇⠀⠀⠀⠀⠈⣿⡆⠀⠀⠀
⠀⠀⠀⠀⠀⠃⠀⣈⣿⣿⣿⣷⣶⣶⠀⠀⣿⠋⠇⠀⠀⠀⠀⠀⢸⣿⣿⠀⢰⣿⣿⡀⠀⢸⣿⣷⡄⢹⣿⣿⠀⡀⢀⣿⣿⠁⠀⠀⠀⠀⠃⠀⠀⠀⣿⠋⠄⠀⠀⠀⠀⠀⢸⣿⣿⠀⢻⡿⣷⣶⡖⠀⠀⠹⠃⠀⠀⠀
⠀⠀⠀⠀⠀⠀⠴⠟⣹⣿⡟⢈⣿⠇⠀⢠⣿⠀⠀⠀⠀⠀⠀⠀⠸⢹⣿⠀⠀⣿⣿⣷⡄⠈⠉⣿⡇⠈⢿⣇⠀⢣⣸⣿⡟⠀⠀⠀⠀⠀⠀⠠⣄⢠⣿⠀⠀⠀⠀⠀⠀⠀⠸⢹⣿⠀⠈⠇⢻⣿⣇⠀⠀⠀⠀⠀⠀⠀
⠀⠀⠀⠀⠀⠀⠀⠀⣿⣿⡇⢸⠃⠀⠀⢸⣷⡀⠀⠀⠀⠀⠀⠀⠀⣼⣿⡆⠀⠏⣿⣿⡇⠀⠀⣿⣷⠀⠘⢿⡆⠘⣿⣿⣷⠄⠀⠀⣀⣀⣀⡀⠘⣿⣷⡀⠀⠀⠀⠀⠀⠀⠀⣼⣿⡆⠀⠀⠀⠙⣿⣦⡀⠀⠀⠀⠀⠀
⠀⠀⠀⠀⠀⠀⠀⠀⣿⣿⡇⠈⠀⠀⠀⢸⣿⣿⡄⠀⠀⠀⠀⠀⠀⣿⡿⠃⠀⠀⣿⣿⡇⠀⠀⢸⣿⣦⣀⣸⣷⠀⡇⣿⣿⠀⠀⠀⠀⠉⠉⢻⣿⣿⣿⣷⡀⠀⠀⠀⠀⠀⠀⣿⡿⠃⠠⡀⠀⠀⠈⣿⣿⣷⣦⡄⠀⠀
⠀⠀⠀⠀⠀⠀⠀⠀⠙⢿⡇⠀⠀⠀⠀⠀⠏⣿⡿⠀⠀⠀⠀⠀⢰⣿⡇⠀⠀⠀⣿⣿⡇⠀⠀⠈⠃⠙⢿⣿⣿⡀⢻⣿⣏⠀⠀⠀⠀⠀⠀⢼⢿⣿⣏⣿⣿⠀⠀⠀⠀⠀⢰⣿⡄⠀⠀⢻⡄⠀⠀⢸⡟⢿⣿⡇⠀⠀
⠀⠀⠀⠀⠀⠀⠀⠀⠀⢸⣿⠀⠀⠀⠀⠀⠸⣿⣇⠀⠀⠀⠀⠀⠈⣿⣷⠀⠀⠀⣿⣿⠑⠀⠀⠀⠀⠀⠈⢻⣿⣇⠈⣿⣿⠀⠀⠀⠀⠀⠀⢀⣼⡿⢻⣿⣅⠀⠀⠀⠀⠀⠈⣿⡇⠀⠀⠘⣷⠀⠀⠸⠁⢀⣿⣇⠀⠀
⠀⠀⠀⠀⠀⠀⠀⠀⢀⣿⣿⠀⠀⠀⠀⠀⠀⠘⣿⣆⠀⠀⠀⠀⠀⣿⣿⠀⠀⠀⣻⣿⡀⠀⠀⠀⠀⠀⠀⢸⣿⡿⡄⠈⣿⣇⠀⠀⠀⠀⠀⣼⣿⠃⠀⣿⣿⣆⠀⠀⠀⠀⠀⢿⡇⠀⠀⠀⣿⡄⠀⠀⢀⣿⣿⣿⡀⠀
⠀⠀⠀⠀⠀⠀⠀⠀⢾⢻⣿⣄⠀⠀⠀⠀⠀⠀⢻⣿⡄⠀⠀⠀⢀⣿⣿⠀⠀⢠⣿⣿⠇⠀⠀⠀⠀⠀⠀⢸⣿⠁⠀⠀⣿⣿⡀⠀⠀⠀⢠⣿⡟⠀⠀⢹⣿⣿⡄⠀⠀⠀⢀⣾⡇⠀⠀⠀⣿⡇⠀⠀⣸⣿⠋⡿⠃⠀
⠀⠀⠀⠀⠀⠀⠀⠀⠀⢸⣿⡿⠀⠀⠀⠀⠀⠀⣼⣿⡇⠀⠀⢠⣿⣿⠇⠀⠀⣼⣿⡇⠀⠀⠀⠀⠀⠀⣰⣿⡿⠀⠀⠀⣿⣿⡇⠀⠀⠀⣾⣿⣇⠀⠀⠈⣿⣿⡇⠀⠀⢠⣿⣿⠃⠀⠀⢠⣿⣿⠀⢀⣿⡏⠀⡇⠀⠀
⠀⠀⠀⠀⠀⠀⠀⠀⠀⣿⣿⠁⠀⠀⠀⠀⠀⠀⢹⣿⡀⠀⢀⣿⣿⠁⠀⠀⠀⣿⣿⠁⠀⠀⠀⠀⠀⠰⠁⣿⡇⠀⠀⠀⢹⢸⣿⠀⠀⢸⠇⢻⣿⠀⠀⠀⢿⣿⡄⠀⢀⣿⣿⠁⠀⠀⠀⢾⣏⠙⠀⣸⣿⡇⠀⠁⠀⠀
⠀⠀⠀⠀⠀⠀⠀⠀⣼⣿⡇⠀⠀⠀⠀⠀⠀⠀⠈⣿⣧⠀⣼⣿⢹⠀⠀⠀⠀⢿⣿⠀⠀⠀⠀⠀⠀⠃⢠⣿⡇⠀⠀⠀⠀⢸⣿⣆⠀⠸⠀⣼⡟⠀⠀⠀⠈⣿⣧⢀⣾⣿⢹⠀⠀⠀⠀⢸⣿⣶⣤⣿⣿⣧⠀⠀⠀⠀
⠀⠀⠀⠀⠀⠀⠀⠀⢻⣯⠡⠀⠀⠀⠀⠀⠀⠀⠀⠘⣿⣿⣿⡇⢸⠀⠀⠀⠀⢸⣟⠀⠀⠀⠀⠀⠀⠀⢸⣿⡟⠀⠀⠀⠀⠀⣿⣿⡄⠀⢀⣿⠁⠀⠀⠀⠀⠘⣿⣿⣿⡇⢸⠀⠀⠀⠀⠘⡏⣿⣿⡿⠉⠻⡀⠀⠀⠀
⠀⠀⠀⠀⠀⠀⠀⠀⠈⣿⡀⠀⠀⠀⠀⠀⠀⠀⠀⠀⣿⢿⣿⡇⢸⠀⠀⠀⠀⡾⣿⡆⠀⠀⠀⠀⠀⠀⢸⣿⡇⠀⠀⠀⠀⠀⠹⣿⣿⣦⣾⡇⠀⠀⠀⠀⠀⠀⣿⢿⣿⡇⢸⠀⠀⠀⠀⠀⠇⢸⣿⠃⠀⠀⠁⠀⠀⠀
⠀⠀⠀⠀⠀⠀⠀⠀⠀⣿⡗⠀⠀⠀⠀⠀⠀⠀⠀⢰⡏⠀⣿⡇⠈⠀⠀⠀⠀⠀⣿⡇⠀⠀⠀⠀⠀⠀⠘⣿⡇⠀⠀⠀⠀⠀⠀⠸⡏⢻⣿⡇⠀⠀⠀⠀⠀⢰⡏⠘⣿⡇⠈⠀⠀⠀⠀⠀⠀⢸⣿⠀⠀⠀⠀⠀⠀⠀
⠀⠀⠀⠀⠀⠀⠀⠀⠀⣿⡇⠀⠀⠀⠀⠀⠀⠀⠀⠈⣷⠄⠃⢻⠀⠀⠀⠀⠀⠀⣿⠁⠀⠀⠀⠀⠀⠀⠀⢸⣷⠀⠀⠀⠀⠀⠀⠀⠃⠀⣿⡇⠀⠀⠀⠀⠀⠈⣷⠄⠇⢻⠀⠀⠀⠀⠀⠀⠀⢸⣿⡇⠀⠀⠀⠀⠀⠀
⠀⠀⠀⠀⠀⠀⠀⠀⠀⢻⡇⠀⠀⠀⠀⠀⠀⠀⠀⠀⣸⠀⠀⠈⠀⠀⠀⠀⠀⠀⣿⠀⠀⠀⠀⠀⠀⠀⠀⠉⣿⠀⠀⠀⠀⠀⠀⠀⠀⢸⣿⡅⠀⠀⠀⠀⠀⠀⣸⠀⠀⠈⠀⠀⠀⠀⠀⠀⠀⣾⢻⡇⠀⠀⠀⠀⠀⠀
⠀⠀⠀⠀⠀⠀⠀⠀⠀⢸⡇⠀⠀⠀⠀⠀⠀⠀⠀⠀⣿⠀⠀⠀⠀⠀⠀⠀⠀⠀⣿⠀⠀⠀⠀⠀⠀⠀⠀⠀⣿⠀⠀⠀⠀⠀⠀⠀⠀⢸⣿⢷⡄⠀⠀⠀⠀⠀⣿⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠋⢸⡇⠀⠀⠀⠀⠀⠀
⠀⠀⠀⠀⠀⠀⠀⠀⠀⢸⣧⠀⠀⠀⠀⠀⠀⠀⠀⠀⢹⡄⠀⠀⠀⠀⠀⠀⠀⠀⢻⠀⠀⠀⠀⠀⠀⠀⠀⠀⡟⠀⠀⠀⠀⠀⠀⠀⠀⢸⡏⠈⢳⠀⠀⠀⠀⠀⢹⡄⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⢸⡇⠀⠀⠀⠀⠀⠀
⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⣿⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠈⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠃⠀⠀⠀⠀⠀⠀⠀⠀⠈⣇⠀⠈⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠈⢷⠀⠀⠀⠀⠀⠀
⠀⠀⠀⠀⠀⠀⠀⠀⠀⢰⠃⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⢹⡀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⢰⠟⠀⠀⠀⠀⠀⠀
⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⡇⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⡘⠀⠀⠀⠀⠀⠀⠀
⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠙⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠁⠀⠀⠀⠀⠀⠀⠀
EOF
let g:startify_bookmarks = [ '~/proj', '~/.config/nvim/init.vim', '~/.local/src/dwm/config.def.h', '~/.local/themes']
let g:startify_files_number = 5
let g:startify_lists = [
						\ { 'type': 'files',     'header': ['   files']            },
						\ { 'type': 'bookmarks', 'header': ['   bookmarks']      },
						\ { 'type': 'sessions',  'header': ['   sessions']       },
						\ ]


" status line
hi StatusLine cterm=NONE
hi StatusLineNC cterm=NONE
hi WinSeparator cterm=NONE
hi StatusLineSpace cterm=strikethrough

set laststatus=3
set statusline=
set statusline+=\ %t
set statusline+=\ %m
set statusline+=\ %r\ 
set statusline+=%#StatusLineSpace#
set statusline+=%=
set statusline+=%#StatusLine#
set statusline+=\ \ [%n]
set statusline+=\ \ \ %{&fileformat}\ \|
set statusline+=\ %{&fileencoding?&fileencoding:&encoding}\ \|
set statusline+=\ fxngxs\ \|
set statusline+=\ %p%%\ \|
set statusline+=\ %-3c


set viminfo+=n~/.config/nvim/viminfo
set relativenumber
set number
set nowrap
set nohlsearch
set tabstop=4
set softtabstop=4
set shiftwidth=4
set expandtab
set noequalalways
syntax on

let mapleader = " "
nnoremap <space> <nop>

" unmap useless keys
nnoremap <Up> <nop>
nnoremap <Down> <nop>
nnoremap <Left> <nop>
nnoremap <Right> <nop>

nnoremap <leader>y "+y
vnoremap <leader>y "+y

nnoremap <leader>p "+p
nnoremap <leader>P "+P
vnoremap <leader>p "+p

nnoremap <leader>cd :LspDefinition<cr>
nnoremap <leader>cD :LspDeclaration<cr>
nnoremap <leader>ch :LspHover<cr>
nnoremap <leader>cr :LspReferences<cr>
nnoremap <leader>cf :LspWorkspaceSymbol<cr>
nnoremap <leader>cR :LspRename<cr>

" logo paste
nnoremap <leader><F12> :r ~/files/logos/toxic<cr> 
nnoremap <leader><F11> :r ~/files/logos/small<cr>

" quick commenting
vnoremap <leader>K :norm 0i*  <cr>`<O<esc>d0xi/*<esc>`>o<esc>d0xi*/<esc>
vnoremap <leader>k <esc>`>a */<esc><esc>`<i/* <esc>
vnoremap <leader>uK :norm 03x<cr>
vnoremap <leader>uk <esc>`<3x`>xxx

nnoremap <leader>bl :Buffers<cr>
nnoremap <leader>bd :bd!<cr>
nnoremap <leader>bn :bn<cr>
nnoremap <leader>bp :bp<cr>
nnoremap <leader>ba :badd 

nnoremap <leader>vh :vsplit<cr>
nnoremap <leader>vj :below split<cr>
nnoremap <leader>vk :split<cr>
nnoremap <leader>vl :below vsplit<cr>

nnoremap <leader>l :BLines<cr>
nnoremap <leader>L :Lines<cr>

nnoremap <leader>rl :AsyncRun -mode=term -pos=right -cols=100<space>
nnoremap <leader>rj :AsyncRun -mode=term -pos=bottom -rows=15<space>
nnoremap <leader>rh :AsyncRun -mode=term -pos=left -cols=100<space>
nnoremap <leader>rk :AsyncRun -mode=term -pos=top -rows=15<space>
nnoremap <leader>rt :AsyncRun -mode=term -pos=TAB -reuse<space>
nnoremap <leader>rq :AsyncRun<space>

nnoremap <leader>e :term<cr>
tnoremap <esc> <c-\><c-n>

nnoremap <leader>tn :tabe<cr>
nnoremap <leader>to :tabo<cr>

nnoremap <leader>f :Files %:p:h<cr>
nnoremap <leader>F :FilesGlob<cr>
nnoremap <leader>- :Lf<cr>

nnoremap <leader>w :w<cr>
nnoremap <leader>z :cclose<cr>

nnoremap <leader>sm :call ReadMan()<cr><c-r><c-w>

" build and run
nnoremap <leader><F1> :AsyncRun -cwd=<root> if [ -f "Makefile" \] \|\| [ -f "makefile" \]; then make; else ./build.sh; fi<cr>
nnoremap <leader><F2> :AsyncRun -mode=term -pos=left -cols=100 -cwd=<root> ./run.sh<cr>

" option bindings
nnoremap <leader>Oc :set termguicolors!<cr>
nnoremap <leader>Oh :set hlsearch!<cr> 
nnoremap <leader>Ou :set ignorecase!<cr>

" command aliases
command CDC cd %:p:h
