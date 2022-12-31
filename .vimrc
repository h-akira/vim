" 文字コード
set encoding=utf-8
set fileencodings=iso-2022-jp,euc-jp,sjis,utf-8
set fileformats=unix,dos,mac

" 基本
set number
set autoread
set cursorline
"set cursorcolumn
set virtualedit=onemore
" set showmatch

"検索
set hlsearch
set incsearch
set smartcase

"インデント
let g:python_recommended_style = 0
set expandtab
set tabstop=2
set softtabstop=2
set shiftwidth=2
set smartindent

"プラグイン
call plug#begin()
Plug 'Yggdroot/indentLine'
Plug 'thinca/vim-template'
Plug 'tomtom/tcomment_vim'
" カラースキーム
Plug 'Shougo/unite.vim'
Plug 'ujihisa/unite-colorscheme'
Plug 'jonathanfilip/vim-lucius'
Plug 'vim-airline/vim-airline'
Plug 'tomasr/molokai'
Plug 'gosukiwi/vim-atom-dark'
Plug 'jacoborus/tender.vim'
Plug 'vim-airline/vim-airline'
" 補完
Plug 'Shougo/ddc.vim'
Plug 'vim-denops/denops.vim'
Plug 'Shougo/ddc-ui-native'
Plug 'Shougo/ddc-source-around'
Plug 'Shougo/ddc-matcher_head'
Plug 'Shougo/ddc-sorter_rank'
Plug 'LumaKernel/ddc-file'
Plug 'mattn/vim-lsp-settings'
Plug 'prabirshrestha/vim-lsp'
Plug 'shun/ddc-source-vim-lsp'
call plug#end()

" コメントアウト
let g:tcomment_opleader1 = 'fc'
setlocal formatoptions-=ro
" カラースキーム
"colorscheme lucius
colorscheme molokai
"colorscheme atom-dark 
"set background=dark
"let g:ligthline = { 'colorscheme': 'lucius' }

" テンプレート
autocmd User plugin-template-loaded call s:template_keywords()
function! s:template_keywords()
	%s/<+DATE+>/\=strftime('%Y-%m-%d')/g
endfunction
autocmd User plugin-template-loaded
\    if search('<+CURSOR+>')
\  |   execute 'normal! "_da>'
\  | endif

" 補完 """""""""""""""""""""""""""""""""""""""""""""""""
let g:lsp_diagnostics_signs_enabled = 0
let g:lsp_diagnostics_highlights_enabled = 0
let g:lsp_log_file = ""
" let g:lsp_completion_documentation_delay = 1000
" let g:lsp_diagnostics_highlights_delay = 1000
" let g:lsp_diagnostics_signs_delay = 1000
" let g:lsp_diagnostics_virtual_text_delay = 1000
" let g:lsp_document_code_action_signs_delay = 1000
" let g:lsp_inlay_hints_delay = 1000
" let g:lsp_document_highlight_delay = 1000
" let g:lsp_signature_help_delay = 3000
" https://github.com/Shougo/ddc.vimより
" Customize global settings

" You must set the default ui.
" Note: native ui
" https://github.com/Shougo/ddc-ui-native
call ddc#custom#patch_global('ui', 'native')
call ddc#custom#patch_global('sourceParams', #{
      \   around: #{ maxSize: 500 },
      \ })
" https://github.com/LumaKernel/ddc-source-fileより
call ddc#custom#patch_global('sources', ['file', 'around', 'vim-lsp'])
call ddc#custom#patch_global('sourceOptions', {
      \ '_': {
      \   'matchers': ['matcher_head'],
      \   'sorters': ['sorter_rank']
      \},
      \ 'file': {
      \   'mark': 'F',
      \   'isVolatile': v:true,
      \   'forceCompletionPattern': '\S/\S*',
      \ },
      \ 'vim-lsp': {
      \   'mark': 'lsp', 
      \   'matchers': ['matcher_head'],
      \ }
      \})
call ddc#custom#patch_filetype(
    \ ['ps1', 'dosbatch', 'autohotkey', 'registry'], {
      \ 'sourceOptions': {
      \   'file': {
      \     'forceCompletionPattern': '\S\\\S*',
    \   },
    \ },
    \ 'sourceParams': {
      \   'file': {
      \     'mode': 'win32',
    \   },
    \ }})

" <TAB>: completion.
inoremap <silent><expr> <TAB>
\ pumvisible() ? '<C-n>' :
\ (col('.') <= 1 <Bar><Bar> getline('.')[col('.') - 2] =~# '\s') ?
\ '<TAB>' : ddc#map#manual_complete()

" <S-TAB>: completion back.
inoremap <expr><S-TAB>  pumvisible() ? '<C-p>' : '<C-h>'

" Use ddc.
call ddc#enable()
""""""""""""""""""""""""""""""""""""""""""""""""""""""""
" if executable('pylsp')
"     " pip install python-lsp-server
"     au User lsp_setup call lsp#register_server({
"         \ 'name': 'pylsp',
"         \ 'cmd': {server_info->['pylsp']},
"         \ 'allowlist': ['python'],
"         \ })
" endif
" 
" function! s:on_lsp_buffer_enabled() abort
"     setlocal omnifunc=lsp#complete
"     setlocal signcolumn=yes
"     if exists('+tagfunc') | setlocal tagfunc=lsp#tagfunc | endif
"     nmap <buffer> gd <plug>(lsp-definition)
"     nmap <buffer> gs <plug>(lsp-document-symbol-search)
"     nmap <buffer> gS <plug>(lsp-workspace-symbol-search)
"     nmap <buffer> gr <plug>(lsp-references)
"     nmap <buffer> gi <plug>(lsp-implementation)
"     nmap <buffer> gt <plug>(lsp-type-definition)
"     nmap <buffer> <leader>rn <plug>(lsp-rename)
"     nmap <buffer> [g <plug>(lsp-previous-diagnostic)
"     nmap <buffer> ]g <plug>(lsp-next-diagnostic)
"     nmap <buffer> K <plug>(lsp-hover)
"     nnoremap <buffer> <expr><c-f> lsp#scroll(+4)
"     nnoremap <buffer> <expr><c-d> lsp#scroll(-4)
" 
"     let g:lsp_format_sync_timeout = 1000
"     autocmd! BufWritePre *.rs,*.go call execute('LspDocumentFormatSync')
"     
"     " refer to doc to add more commands
" endfunction
" 
" augroup lsp_install
"     au!
"     " call s:on_lsp_buffer_enabled only for languages that has the server registered.
"     autocmd User lsp_buffer_enabled call s:on_lsp_buffer_enabled()
" augroup END
