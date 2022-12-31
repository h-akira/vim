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
" https://github.com/Shougo/ddc.vimより
" Customize global settings

" You must set the default ui.
" Note: native ui
" https://github.com/Shougo/ddc-ui-native
call ddc#custom#patch_global('ui', 'native')

" Use around source.
" https://github.com/Shougo/ddc-source-around
call ddc#custom#patch_global('sources', ['around'])

" Use matcher_head and sorter_rank.
" https://github.com/Shougo/ddc-matcher_head
" https://github.com/Shougo/ddc-sorter_rank
call ddc#custom#patch_global('sourceOptions', #{
      \ _: #{
      \   matchers: ['matcher_head'],
      \   sorters: ['sorter_rank']},
      \ })

call ddc#custom#patch_global('sourceParams', #{
      \   around: #{ maxSize: 500 },
      \ })

" Mappings

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

