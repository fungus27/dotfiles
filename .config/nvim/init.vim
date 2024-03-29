" plugins
call plug#begin()
Plug 'easymotion/vim-easymotion'
Plug 'jackguo380/vim-lsp-cxx-highlight'
Plug 'junegunn/fzf', { 'do': { -> fzf#install() } }
Plug 'junegunn/fzf.vim'
Plug 'mhinz/vim-startify'
Plug 'prabirshrestha/vim-lsp'
Plug 'ptzz/lf.vim'
Plug 'simeji/winresizer'
Plug 'skywind3000/asyncrun.vim'
Plug 'tpope/vim-fugitive'
Plug 'voldikss/vim-floaterm'
Plug 'whonore/Coqtail', { 'for': 'coq' }
Plug 'xuhdev/vim-latex-live-preview', { 'for': 'tex' }
Plug '~/.local/share/nvim/plugged/coq-conceal' " TODO: make this a plugin
" colorschemes
Plug 'andreasvc/vim-256noir'
Plug 'arcticicestudio/nord-vim'
Plug 'cocopon/iceberg.vim'
Plug 'fcpg/vim-orbital'
Plug 'mcchrish/snow'
Plug 'nanotech/jellybeans.vim'
Plug 'rebelot/kanagawa.nvim'
Plug 'sainnhe/everforest'
Plug 'sainnhe/gruvbox-material'
Plug 'srcery-colors/srcery-vim'
call plug#end()


" custom functions
fun! ReadMan()
		" Assign current word under cursor to a script variable:
        let s:c_word = expand("<cword>")
		let s:man_word = input("man page for (" . s:c_word . "): ")

        if s:man_word == ""
            let s:man_word = s:c_word
        endif

		" Open a new window:
		exe ":100vnew"
        exe "setlocal bt=nofile bh=wipe nobl noswf"
        exe ":file [man] " . s:man_word
		" Read in the manpage for man_word (col -b is for formatting):
		exe ":r!man " . s:man_word . " | col -b"
		" Goto first line...
		exe ":goto"
		" and delete it:
		exe ":delete"
        " finally set file type to 'man':
        :exe ":setlocal filetype=man"
endfun

funct! SearchBufs()
    let s:re = input("regex: ")
    cexpr []
    call setqflist([], 'a', {'title': 'grep "' . s:re . '"'})
    execute 'silent! noautocmd bufdo vimgrepadd /' . s:re . '/j %'
    cw
endfunct

function DelTrailWs() abort
    normal mz
    %s/\v\s+$//ge
    normal `z
endfunc

fun! IncludeGuard()
    let s:name = substitute(toupper(expand("%:t")), "\\.", "_", "g")
    exe "norm ggO#ifndef " . s:name . "\<cr>#define " . s:name . "\<cr>\<esc>Go\<cr>#endif // " . s:name
endfun

fun! Breakpoint()
    call setreg('p', "b " . line("."))
    exe ":buffer term"
    exe "norm! \"pp"
endfun

fun! InsertTerm()
    if &buftype ==# "terminal"
       norm i
    endif
endfun

let mapleader = " "
nnoremap <space> <nop>


" lf.vim
let g:lf_map_keys = 0
let g:lf_replace_netrw = 1

" floatterm
let g:floaterm_title = ""
let g:floaterm_borderchars = ""
hi NormalFloat cterm=NONE gui=NONE
hi Floaterm cterm=NONE gui=NONE
hi FloatermBorder cterm=NONE gui=NONE

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
let g:lsp_document_code_action_signs_enabled = 0 " disable wierd A>
let g:lsp_signature_help_enabled = 0 "life saver
let g:lsp_preview_float = 1

hi PopupWindow cterm=NONE gui=NONE

augroup lsp_float_colours
    autocmd!
    if !has('nvim')
        autocmd User lsp_float_opened
                    \ call setwinvar(lsp#document_hover_preview_winid(),
                    \		       '&wincolor', 'PopupWindow')
    else
        autocmd User lsp_float_opened
                    \ call nvim_win_set_option(
                    \   lsp#document_hover_preview_winid(),
                    \   'winhighlight', 'Normal:PopupWindow')
    endif
augroup end

" coqtail
let g:coqtail_nomap = 1

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
" easymotion
let g:EasyMotion_do_mapping = 0
nnoremap <leader>a <Plug>(easymotion-s)
nnoremap <leader>f <Plug>(easymotion-bd-w)

" vim-fugitive
let g:fugitive_no_maps = 1

" vim-latex-live-preview
let g:livepreview_previewer = 'zathura'

" status line
hi StatusLine cterm=NONE
hi StatusLineNC cterm=NONE
hi WinSeparator cterm=NONE
hi StatusLineSpace cterm=strikethrough

augroup CS_CHANGE
    autocmd!
    autocmd ColorScheme * hi StatusLine cterm=NONE
    autocmd ColorScheme * hi StatusLineNC cterm=NONE
    autocmd ColorScheme * hi WinSeparator cterm=NONE
    autocmd ColorScheme * hi StatusLineSpace cterm=strikethrough
augroup END

augroup LSP_HIGHLIGHT
    autocmd!
    autocmd User EasyMotionPromptEnd LspCxxHighlight
augroup END

augroup NOMATCHPAREN
    autocmd!
    autocmd TermEnter * NoMatchParen
    autocmd TermLeave * DoMatchParen
augroup END

augroup NO_AUTO_COMMENT
    autocmd!
    autocmd FileType * setlocal formatoptions-=o
augroup END


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
set statusline+=\ fvngvs\ \|
set statusline+=\ %p%%\ \|
set statusline+=\ %-3c

set expandtab
set noequalalways
set nohlsearch
set nowrap
set number
set relativenumber
set scrolloff=10
set shiftwidth=4
set showtabline=0
set softtabstop=4
set tabstop=4
set viminfo+=n~/.config/nvim/viminfo
set undofile
set lazyredraw
set mouse=
syntax on

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

nnoremap <leader>gd :LspDefinition<cr>
nnoremap <leader>gD :LspDeclaration<cr>
nnoremap <leader>h :LspHover<cr>
nnoremap <leader>lr :LspReferences<cr>
nnoremap <leader>/s :LspWorkspaceSymbol<cr>
nnoremap <leader>R :LspRename<cr>

" logo paste
nnoremap <leader><F12> :r ~/files/logos/toxic<cr> 
nnoremap <leader><F11> :r ~/files/logos/small<cr>

" quick commenting
vnoremap <leader>C :norm 0i*  <cr>`<O<esc>d0xi/*<esc>`>o<esc>d0xi*/<esc>
vnoremap <leader>c <esc>`>a */<esc><esc>`<i/* <esc>
vnoremap <leader>uC :norm 03x<cr>
vnoremap <leader>uc <esc>`<3x`>xxx

nnoremap <leader>bl :Buffers<cr>
nnoremap <leader>bd :bd<cr>
nnoremap <leader>bt :b term://<cr>
nnoremap <C-n> :bn<cr>
nnoremap <C-p> :bp<cr>
" alternate buffer
nnoremap <BS> <C-^>

nnoremap <leader>vh :vsplit<cr>
nnoremap <leader>vj :below split<cr>
nnoremap <leader>vk :split<cr>
nnoremap <leader>vl :below vsplit<cr>

nnoremap <leader>r :AsyncRun<space>

nnoremap <leader>t :term<cr>
tnoremap <a-q> <c-\><c-n>
nnoremap <a-b> :call Breakpoint()<cr>

" split movement
tnoremap <C-h> <C-\><C-n><C-w>h
tnoremap <C-j> <C-\><C-n><C-w>j
tnoremap <C-k> <C-\><C-n><C-w>k
tnoremap <C-l> <C-\><C-n><C-w>l
nnoremap <silent> <C-h> <C-w>h:call InsertTerm()<cr>
nnoremap <silent> <C-j> <C-w>j:call InsertTerm()<cr>
nnoremap <silent> <C-k> <C-w>k:call InsertTerm()<cr>
nnoremap <silent> <C-l> <C-w>l:call InsertTerm()<cr>

nnoremap <leader>sr :FilesGlob<cr>
nnoremap <leader>lf :GFiles<cr>
nnoremap <leader>ll :Lines<cr>
nnoremap <leader>lc :Commits<cr>
nnoremap <leader>lbc :BCommits<cr>
vnoremap <leader>lbc :BCommits<cr>
nnoremap <leader>- :Lf<cr>

nnoremap <leader>w :w<cr>
nnoremap <leader>z :cclose<cr>
nnoremap <leader>Z :copen<cr>

nnoremap <leader>m :call ReadMan()<cr>
nnoremap <leader>/b :call SearchBufs()<cr>

" build and run
nnoremap <leader><F1> :AsyncRun -cwd=<root> if [ -f "Makefile" \] \|\| [ -f "makefile" \]; then make; else ./build.sh; fi<cr>
nnoremap <leader><F2> :AsyncRun -mode=term -pos=left -cols=100 -cwd=<root> ./run.sh<cr>

" option bindings
nnoremap <leader>\c :set termguicolors!<cr>
nnoremap <leader>\h :set hlsearch!<cr>
nnoremap <leader>\u :set ignorecase!<cr>

" coq
augroup COQ
    autocmd!
    autocmd FileType coq nnoremap <leader>cc :CoqStart<cr>
    autocmd FileType coq nnoremap <leader>cq :CoqStop<cr>
    autocmd FileType coq nnoremap <a-j> :CoqNext<cr>
    autocmd FileType coq nnoremap <a-k> :CoqUndo<cr>
    autocmd FileType coq nnoremap <leader>cl :CoqToLine<cr>
augroup END

" commands
command CDC cd %:p:h
