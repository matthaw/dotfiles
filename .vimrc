let g:airline_powerline_fonts = 1
scriptencoding utf-8
set encoding=UTF-8

"if empty(glob('~/.vim/autoload/plug.vim'))
"  silent !mkdir -p "$HOME/.vim/autoload"
"  silent !curl -fLo "$HOME/.vim/autoload/plug.vim" 'https://raw.githubusercontent.com/junegunn/vim-plug/master/plug.vim'
"endif

nmap  <F8> : TagbarToggle <CR>
set enc=utf-8
let g:airline_theme='gruvbox'
let g:airline_powerline_fonts=1
map <C-n> :NERDTreeToggle<CR>
autocmd StdinReadPre * let s:std_in=1
autocmd VimEnter * if argc() == 0 && !exists("s:std_in") | NERDTree | endif

" PlugRemotePlugins(info) {{{
if has('nvim')
  let s:remote_plugins_updated = 0
  function! PlugRemotePlugins(info) abort
    if !s:remote_plugins_updated
      let s:remote_plugins_updated = 1
      UpdateRemotePlugins
    endif
  endfunction
else
  function! PlugRemotePlugins(info) abort
  endfunction
endif
" }}}
set guifont=Monoid\ Nerd\ Font\ 9
" PlugCoc(info) {{{
function! PlugCoc(info) abort
  if a:info.status ==? 'installed' || a:info.force
    !yarn install
    if exists('s:coc_extensions')
      call call('coc#add_extension', s:coc_extensions)
    endif
  elseif a:info.status ==? 'updated'
    !yarn install
    call coc#util#update()
  endif
  call PlugRemotePlugins(a:info)
endfunction
" }}}
call plug#begin('~/.vim/plugged')
" Prelude {{{
Plug 'tpope/vim-sensible'
call plug#load('vim-sensible')
if !has('nvim')
  set pyx=3
  Plug 'roxma/nvim-yarp'
  Plug 'roxma/vim-hug-neovim-rpc'
endif
" }}}
" ColorScheme {{{
Plug 'morhetz/gruvbox'
Plug 'tyrannicaltoucan/vim-deep-space'
" }}}
" Highlighting {{{
"Plug 'junegunn/limelight.vim'
"Plug 'vim-scripts/SyntaxAttr.vim'
"Plug 'guns/xterm-color-table.vim'
"Plug 'powerman/vim-plugin-AnsiEsc'
"Plug 'whatyouhide/vim-lengthmatters'
"Plug 'ntpeters/vim-better-whitespace'
Plug 'nathanaelkane/vim-indent-guides'
let g:indent_guides_enable_on_vim_startup = 1

let g:NERDTreeDirArrowExpandable = '▸'
let g:NERDTreeDirArrowCollapsible = '▾'
" UI {{{
"Plug 'szw/vim-maximizer'
Plug 'itchyny/lightline.vim'
"Plug 'pgdouyon/vim-evanesco'
"Plug 'terryma/vim-expand-region'
"Plug 'oblitum/vim-tmux-navigator'
"Plug 'mhinz/vim-sayonara', {'on': 'Sayonara'}
"Plug 'oblitum/goyo.vim', {'branch': 'custom-groups'}
Plug 'ryanoasis/vim-devicons', {'do': function('PlugRemotePlugins')}
Plug 'kristijanhusak/defx-icons', {'do': function('PlugRemotePlugins')}
" }}}
" Navigation {{{
Plug 'majutsushi/tagbar'
Plug 'Shougo/defx.nvim', {'do': function('PlugRemotePlugins')}

" Debugging {{{
"Plug 'gilligan/vim-lldb'
"Plug 'idanarye/vim-vebugger'
" }}}

Plug 'vim-scripts/SingleCompile'
nmap <F9> :SCCompile<cr>
nmap <F10> :SCCompileRun<cr>

Plug 'vimsence/vimsence'

Plug 'scrooloose/nerdtree'
Plug 'jiangmiao/auto-pairs'

set t_Co=16

" Diagnostics {{{
Plug 'w0rp/ale'
let s:coc_extensions = [
\   'coc-css',
\   'coc-rls',
\   'coc-html',
\   'coc-json',
\   'coc-pyls',
\   'coc-yaml',
\   'coc-emmet',
\   'coc-emoji',
\   'coc-vetur',
\   'coc-eslint',
\   'coc-vimtex',
\   'coc-prettier',
\   'coc-tsserver',
\   'coc-ultisnips'
\ ]
"Plug 'neoclide/coc-neco'
"Plug 'neoclide/coc-denite'
Plug 'neoclide/coc.nvim', {'do': function('PlugCoc')}

" }}}
" FileType {{{
" JSON {{{
Plug 'elzr/vim-json'
" cJSON {{{
"Plug 'neoclide/jsonc.vim'
" }}}
" CSS {{{
"Plug 'hail2u/vim-css3-syntax'
" }}}
" JavaScript {{{
"Plug 'chemzqm/vim-jsx-improve'
" }}}
" TypeScript {{{
"Plug 'leafgarland/typescript-vim'
" }}}
" C++ {{{
Plug 'vim-jp/cpp-vim'
Plug 'octol/vim-cpp-enhanced-highlight'
" }}}
" Python {{{
if !has('nvim')
  Plug 'lambdalisue/vim-pyenv', {'for': 'python'}
endif
" }}}
" LaTeX {{{
"Plug 'lervag/vimtex', {'do': function('PlugRemotePlugins')}
" }}}
" VimL {{{
"Plug 'Shougo/neco-vim', {'do': function('PlugRemotePlugins')}
" }}}
" Go {{{
"Plug 'fatih/vim-go', {'tag': '*', 'do': function('PlugRemotePlugins')}
" }}}
" }}}
call plug#end()
" }}}
" Settings {{{
set t_ut=                     " fix 256 colors in tmux http://sunaku.github.io/vim-256color-bce.html
set nowrap                    " don't wrap lines
set hidden                    " hide buffer without notice
set mouse=a                   " enable mouse
set autoread                  " auto read external file changes
set hlsearch                  " highlight the last searched term
set noshowcmd                 " disable blinking command feedback in bottom-right corner
set guicursor=                " disable cursor shape
set noshowmode                " hide the default mode text (e.g. -- INSERT -- below the statusline)
set noswapfile                " no swap files
set cpoptions+=$              " dollar sign while changing
set pumheight=30              " limit popup menu height
set shortmess+=c              " disable ins-completion-menu 'match 1 of N' messages
set synmaxcol=250             " set max syntax highlighting column to sane level
set conceallevel=2            " hides concealed text
set updatetime=300            " set updatetime to shorter value
set virtualedit=all           " let us walk in limbo
set visualbell t_vb=          " no visual bell
set spelllang=en,pt_br        " set default spelling languages
set completeopt-=preview      " disable the preview window
set clipboard=unnamedplus     " for simplified clipboard copy/paste
set expandtab shiftwidth=4    " space for tabs by default
set tabstop=4 softtabstop=4

let mapleader = ' '

augroup vimrc | autocmd! | augroup end

" Open QuickFix horizontally with line wrap
autocmd vimrc FileType qf wincmd J | setlocal wrap

" Preview window with line wrap
autocmd vimrc WinEnter * if &previewwindow | setlocal wrap | endif
" }}}
" GUI {{{
if has('gui_running')
  set guifont=Monoid\ Nerd\ Font\ 9

  " Remove scroll bars
  set guioptions-=L
  set guioptions-=R
  set guioptions-=l
  set guioptions-=r

  " Disable toolbar
  set guioptions=-t

  " Initial window dimensions
  set lines=47 columns=80
endif
" }}}
" Util {{{
" s:guicolors()                        | check if using guicolors {{{
function! s:guicolors() abort
  return has('gui_running') || has('termguicolors') && &termguicolors
endfunction
" }}}
" s:set_guicolors()                    | set guicolors if available {{{
function! s:set_guicolors() abort
  if has('termguicolors')
    let &t_8f = "\<esc>[38;2;%lu;%lu;%lum"
    let &t_8b = "\<esc>[48;2;%lu;%lu;%lum"
    set termguicolors
  endif
endfunction
" }}}
" s:attr(group, attr, ...)             | get group attribute {{{
function! s:attr(group, attr, ...) abort
  call assert_inrange(0, 1, a:0)
  if a:0 > 0
    let a = synIDattr(synIDtrans(hlID(a:group)), a:attr, a:1)
  else
    let a = synIDattr(synIDtrans(hlID(a:group)), a:attr)
  endif
  return empty(a) || a ==# '-1' ? 'NONE' :  a
endfunction
" }}}
" s:hi(g, gf, gb, ctf, ctb)            | highlighting helper {{{
function! s:hi(group, guifg, guibg, ctermfg, ctermbg) abort
  exec printf('hi %s guifg=%s guibg=%s ctermfg=%s ctermbg=%s',
       \      a:group, a:guifg, a:guibg, a:ctermfg, a:ctermbg)
endfunction
" }}}
" s:fg(group, mode)                    | get foreground of highlighting group {{{
function! s:fg(group, mode) abort
  return s:attr(a:group, s:attr(a:group, 'reverse', a:mode) ? 'bg' : 'fg', a:mode)
endfunction
" }}}
" s:bg(group, mode)                    | get background of highlighting group {{{
function! s:bg(group, mode) abort
  return s:attr(a:group, s:attr(a:group, 'reverse', a:mode) ? 'fg' : 'bg', a:mode)
endfunction
" }}}
" s:export(group)                      | export highlighting group {{{
function! s:export(group) abort
  return {
  \   'fg': s:attr(a:group, 'fg'),
  \   'bg': s:attr(a:group, 'bg'),
  \   'gui': {
  \     'fg': s:attr(a:group, 'fg', 'gui'),
  \     'bg': s:attr(a:group, 'bg', 'gui')
  \   },
  \   'cterm': {
  \     'fg': s:attr(a:group, 'fg', 'cterm'),
  \     'bg': s:attr(a:group, 'bg', 'cterm')
  \   }
  \ }
endfunction
" }}}
" s:backup(groups)                     | generate highlighting backup from redir {{{
function! s:backup(groups) abort
  let backup = ''
  silent! exec 'redir => backup | ' .
          \    join(map(copy(a:groups), '"hi " . v:val'), ' | ') .
          \    ' | redir end'
  return backup
endfunction
" }}}
" s:restore(backup)                    | restore highlighting from redir {{{
function! s:restore(backup) abort
  let hls = map(split(a:backup, '\v\n(\S)@='),
            \         {_, v -> substitute(v, '\v\C(<xxx>|\s|\n)+', ' ', 'g')})
  for hl in hls
    let chunks = split(hl)
    let group = chunks[0]
    let tail = join(chunks[1:])
    exec 'hi clear ' . group
    if tail !=# 'cleared'
      let attrs = split(tail, '\v\c(<links\s+to\s+)@=')
      for attr in attrs
        if attr =~? '\v\c^links\s+to\s+'
          exec printf('hi! link %s %s', group,
               \      substitute(attr, '\v\c^links\s+to\s+', '', ''))
        else
          exec printf('hi %s %s', group, attr)
        endif
      endfor
    endif
  endfor
endfunction
" }}}
" s:rgba(hexcode, alpha)               | convert hexcode to rgba {{{
function! s:rgba(hexcode, alpha) abort
  call assert_match('^\v#\x{6}$', a:hexcode)
  return printf('rgba(%s, %s, %s, %s)',
         \      str2nr(a:hexcode[1:2], 16),
         \      str2nr(a:hexcode[3:4], 16),
         \      str2nr(a:hexcode[5:6], 16),
         \      a:alpha)
endfunction
" }}}
" s:color_distance(hexcode1, hexcode2) | calculate color distance {{{
function! s:color_distance(hexcode1, hexcode2) abort
  call assert_match('^\v#\x{6}$', a:hexcode1)
  call assert_match('^\v#\x{6}$', a:hexcode2)
  let dr = str2nr(a:hexcode1[1:2], 16) - str2nr(a:hexcode2[1:2], 16)
  let dg = str2nr(a:hexcode1[3:4], 16) - str2nr(a:hexcode2[3:4], 16)
  let db = str2nr(a:hexcode1[5:6], 16) - str2nr(a:hexcode2[5:6], 16)
  return dr*dr + dg*dg + db*db
endfunction
" }}}
" s:farthest_color(hexcode, hexcodes)  | return index of farthest color {{{
function! s:farthest_color(hexcode, hexcodes) abort
  let c = -1
  let i = 0
  let d = 0
  for hc in a:hexcodes
    let cd = s:color_distance(a:hexcode, hc)
    if cd > d
      let c = i
      let d = cd
    endif
    let i += 1
  endfor
  return c
endfunction
" }}}
" }}}
" ColorScheme {{{
call s:set_guicolors()

silent! colors deep-space
"let g:gruvbox_contrast_light = 'hard'
"let g:gruvbox_contrast_dark = 'hard'
"silent! colors gruvbox

" Patches {{{
function! s:backup_prior_patches() abort
  if get(g:, 'colors_name', '') != get(g:, 'last_colors_name', '')
    let g:last_colors_name = get(g:, 'colors_name', '')
    let g:color_backup_normal = s:export('Normal')
    let g:color_backup = s:backup(['Normal', 'NonText'])
  endif
endfunction

function! s:apply_colorscheme_patches() abort
  hi! link Conceal Normal
  hi! link EndOfBuffer NonText
  if !has('gui_running')
    hi Normal guibg=NONE ctermbg=NONE
    hi NonText guibg=NONE ctermbg=NONE
  endif
  if exists('g:loaded_lightline')
    call s:hi('SignColumn',
         \    'NONE', g:lightline#palette().normal.middle[0][1],
         \    'NONE', g:lightline#palette().normal.middle[0][3])
  endif
  hi! link LineNr SignColumn
endfunction

autocmd vimrc VimEnter *
\   if !exists('g:color_backup')
\|    call s:backup_prior_patches() | call s:apply_colorscheme_patches()
\|  endif
autocmd vimrc ColorScheme * call s:backup_prior_patches() | call s:apply_colorscheme_patches()
" }}}
" }}}
" FileType {{{
" VimL {{{
autocmd vimrc FileType vim setlocal foldmethod=marker
" }}}
" C++ {{{
autocmd vimrc BufNewFile,BufRead *
\   if expand('%:e') =~? '^\(h\|hh\|hxx\|hpp\|ii\|ixx\|ipp\|inl\|txx\|tpp\|tpl\|cc\|cxx\|cpp\)$'
\|    if &ft !=# 'cpp'
\|      set ft=cpp
\|    endif
\|  endif
autocmd vimrc FileType cpp setlocal cinoptions+=L0 " disable automatic label dedent
" }}}
" CSS {{{
augroup VimCSS3Syntax
  autocmd!
  autocmd FileType css setlocal iskeyword+=-
augroup end
" }}}
" Markdown {{{
autocmd vimrc FileType markdown setlocal spell
" }}}
" Git {{{
autocmd vimrc FileType gitcommit setlocal spell
" }}}

" Plugin {{{
" Highlighting
" vim-lengthmatters {{{
let g:lengthmatters_excluded = [
\   'vim-plug', 'denite', 'tagbar', 'Mundo.*', 'defx', 'quickrun', 'codi', 'trans',
\   '', 'zsh', 'html', 'javascript', 'json', 'css', 'scss', 'latex',
\   'haskell', 'purescript', 'elm', 'java',
\   'mailcap', 'muttrc',
\   'git', '.*debug.*'
\ ]
autocmd vimrc VimEnter,ColorScheme *
\   if exists('g:loaded_lightline') && exists('g:loaded_lengthmatters')
\|    call lengthmatters#highlight(
\       printf('guibg=%s ctermbg=%d',
\          g:lightline#palette().normal.middle[0][1],
\          g:lightline#palette().normal.middle[0][3]))
\|  endif
" }}}
" vim-operator-highlight {{{
"let g:ophigh_highlight_link_group = 'Keyword'
" }}}
" vim-better-whitespace {{{
let g:better_whitespace_filetypes_blacklist = [
\   'diff', 'gitcommit', 'qf', 'help', 'vim-plug', 'denite', 'tagbar',
\   'Mundo', 'MundoDiff', 'defx', 'quickrun', 'codi', 'mail', 'muttrc'
\ ]
let g:better_whitespace_operator = ''
" }}}
" vim-indent-guides {{{
let g:indent_guides_enable_on_vim_startup = 0
" }}}
" UI
" lightline.vim {{{
let g:lightline = {'colorscheme': 'deepspace'}
"let g:lightline = {'colorscheme': 'gruvbox'}
let g:lightline.active = {
\   'left' : [
\     ['mode', 'paste'],
\     ['fugitive'],
\     ['filepath', 'filename_active', 'current_tag']
\   ],
\   'right': [
\     ['lineinfo', 'coc_error', 'coc_warning', 'coc_info', 'coc_hint', 'coc_fix',
\      'ale_error', 'ale_warning', 'ale_info', 'ale_style_error', 'ale_style_warning'],
\     ['filetype'],
\     ['fileinfo']
\   ]
\ }
let g:lightline.inactive = {
\   'left' : [['filepath', 'filename_inactive']],
\   'right': [['lineinfo'], ['filetype'], ['fileinfo']]
\ }
let g:lightline.component = {
\   'mode': '%#RedStar#%#LightlineLeft_active_0#%{LightlineMode()}'
\ }
let g:lightline.component_function = {
\   'fugitive'         : 'LightlineFugitive',
\   'filepath'         : 'LightlineFilepath',
\   'filename_active'  : 'LightlineFilenameActive',
\   'filename_inactive': 'LightlineFilenameInactive',
\   'current_tag'      : 'LightlineCurrentTag',
\   'lineinfo'         : 'LightlineLineinfo',
\   'fileinfo'         : 'LightlineFileinfo',
\   'filetype'         : 'LightlineFiletype'
\ }
let g:lightline.component_expand = {
\   'coc_error'        : 'LightlineCocErrors',
\   'coc_warning'      : 'LightlineCocWarnings',
\   'coc_info'         : 'LightlineCocInfos',
\   'coc_hint'         : 'LightlineCocHints',
\   'coc_fix'          : 'LightlineCocFixes',
\   'ale_error'        : 'LightlineAleErrors',
\   'ale_warning'      : 'LightlineAleWarnings',
\   'ale_info'         : 'LightlineAleInfos',
\   'ale_style_error'  : 'LightlineAleStyleErrors',
\   'ale_style_warning': 'LightlineAleStyleWarnings'
\ }
let g:lightline.component_type = {
\   'coc_error'        : 'error',
\   'coc_warning'      : 'warning',
\   'coc_info'         : 'tabsel',
\   'coc_hint'         : 'middle',
\   'coc_fix'          : 'middle',
\   'ale_error'        : 'error',
\   'ale_warning'      : 'warning',
\   'ale_info'         : 'tabsel',
\   'ale_style_error'  : 'error',
\   'ale_style_warning': 'warning'
\ }
let g:lightline.separator = {'left': '', 'right': ''}
let g:lightline.subseparator = {'left': '', 'right': ''}
" LightlineMode() {{{
function! LightlineMode() abort
  call s:hi('RedStar', '#ff0000', s:bg('LightlineLeft_active_0', 'gui')
       \             , 196, s:bg('LightlineLeft_active_0', 'cterm'))
  if &filetype ==? 'denite'
    let mode = denite#get_status('raw_mode')
    call lightline#link(tolower(mode[0]))
    return 'DENITE'
  endif
  return s:lightline_is_lean() || s:lightline_is_plain() ? toupper(&filetype) : lightline#mode()
endfunction
" }}}
" LightlineFugitive() {{{
function! LightlineFugitive() abort
  if s:lightline_is_lean() || s:lightline_is_plain() || !exists('*fugitive#head')
    return ''
  endif
  try
    let b = fugitive#head()
  catch
    return ''
  endtry
  return b !=# '' ? '' . (winwidth(0) < 80 ? '' : ' ' . b) : ''
endfunction
" }}}
" LightlineFilepath() {{{
function! LightlineFilepath() abort
  if s:lightline_is_lean()
    return ''
  endif
  if &filetype ==? 'denite'
    return get(get(b:, 'denite_context', {}), 'sorters', '')
  endif
  if s:lightline_is_plain() || winwidth(0) < 80
    return s:lightline_readonly()
  endif
  if exists('+shellslash')
    let saved_shellslash = &shellslash
    set shellslash
  endif
  let path_string = substitute(expand('%:h'), fnamemodify(expand('~'),''), '~', '')
  if !empty(path_string) && winwidth(0) / len(path_string) < 5
    let path_string = substitute(path_string, '\v([^/])[^/]*%(/@=|$)', '\1', 'g')
  endif
  if exists('+shellslash')
    let &shellslash = saved_shellslash
  endif
  let ro = s:lightline_readonly()
  return empty(ro) ? path_string :  ro . ' ' . path_string
endfunction
" }}}
" LightlineFilenameActive() {{{
function! LightlineFilenameActive() abort
  if s:lightline_is_lean()
    return ''
  endif
  if &buftype ==? 'terminal'
    return has('nvim') ? b:term_title . ' (' . b:terminal_job_pid . ')' : ''
  endif
  if &filetype ==? 'denite'
    return denite#get_status_sources()
  endif
  if &filetype ==? 'tagbar'
    return get(g:lightline, 'fname', '')
  endif
  if empty(expand('%:t'))
    return '[No Name]'
  endif

  let mo = s:lightline_modified()
  return empty(mo) ? expand('%:t') : expand('%:t') . ' ' . mo
endfunction
" }}}
" LightlineFilenameInactive() {{{
function! LightlineFilenameInactive() abort
  return s:lightline_is_lean() ? '留' . toupper(&filetype) : LightlineFilenameActive()
endfunction
" }}}
" LightlineCurrentTag() {{{
function! LightlineCurrentTag() abort
  if s:lightline_is_lean() || s:lightline_is_plain() || winwidth(0) < 80
    return ''
  endif
  if !get(s:, 'currenttag_init')
    try
      let tmp = tagbar#currenttag('%', '', '')
    catch
    endtry
    unlet! tmp
    let s:currenttag_init = 1
  endif
  if !exists('*tagbar#currenttag')
    return ''
  endif
  let now = localtime()
  if get(s:, 'currenttag_last_lookup') != now
    let s:currenttag_last_lookup = now
    let s:currenttag_last_seen = tagbar#currenttag('%s', '')
  endif
  let tag = get(s:, 'currenttag_last_seen', '')
  let limit = float2nr(0.15 * winwidth(0))
  return len(tag) > limit ? tag[0:limit] . '…' : tag
endfunction
" }}}
" LightlineLineinfo() {{{
function! LightlineLineinfo() abort
  return &filetype ==? 'help'             ? ''  :
  \      &filetype ==? 'vim-plug'         ? '⚉ ' :
  \      &filetype ==? 'defx'             ? '🖿 ' :
  \      &filetype ==? 'denite'           ? ' ' :
  \      &filetype ==? 'tagbar'           ? ' ' :
  \      &filetype =~? '\v^mundo(diff)?$' ? '⮌ ' :
  \      s:lightline_is_lean() || s:lightline_is_plain() ? ' '  :
  \      printf('%d:%d ☰ %d%%', line('.'), col('.'), 100*line('.')/line('$'))
endfunction
" }}}
" LightlineFileinfo() {{{
function! LightlineFileinfo() abort
  if s:lightline_is_lean() || s:lightline_is_plain() || winwidth(0) < 80
    return ''
  endif
  return printf('%s[%s]',
         \      empty(&fileencoding) ? &encoding : &fileencoding,
         \      &fileformat . (exists('*WebDevIconsGetFileFormatSymbol') ? ' ' . WebDevIconsGetFileFormatSymbol() : ''))
endfunction
" }}}
" LightlineFiletype() {{{
function! LightlineFiletype() abort
  if empty(&filetype) || s:lightline_is_lean() || s:lightline_is_plain()
    return ''
  endif
  return &filetype . (exists('*WebDevIconsGetFileTypeSymbol') ? ' ' . WebDevIconsGetFileTypeSymbol() : '')
endfunction
" }}}
" LightlineCocErrors() {{{
function! LightlineCocErrors() abort
  return s:lightline_coc_diagnostic('error', 'error')
endfunction
" }}}
" LightlineCocWarnings() {{{
function! LightlineCocWarnings() abort
  return s:lightline_coc_diagnostic('warning', 'warning')
endfunction
" }}}
" LightlineCocInfos() {{{
function! LightlineCocInfos() abort
  return s:lightline_coc_diagnostic('information', 'info')
endfunction
" }}}
" LightlineCocHints() {{{
function! LightlineCocHints() abort
  return s:lightline_coc_diagnostic('hints', 'hint')
endfunction
" }}}
" LightlineCocFixes() {{{
function! LightlineCocFixes() abort
  let b:coc_line_fixes = get(get(b:, 'coc_quickfixes', {}), line('.'), 0)
  return b:coc_line_fixes > 0 ? printf('%d ', b:coc_line_fixes) : ''
endfunction
" }}}
" LightlineAleErrors() {{{
function! LightlineAleErrors() abort
  return s:lightline_ale_diagnostic('error')
endfunction
" }}}
" LightlineAleWarnings() {{{
function! LightlineAleWarnings() abort
  return s:lightline_ale_diagnostic('warning')
endfunction
" }}}
" LightlineAleInfos() {{{
function! LightlineAleInfos() abort
  return s:lightline_ale_diagnostic('info')
endfunction
" }}}
" LightlineAleStyleErrors() {{{
function! LightlineAleStyleErrors() abort
  return s:lightline_ale_diagnostic('style_error')
endfunction
" }}}
" LightlineAleStyleWarnings() {{{
function! LightlineAleStyleWarnings() abort
  return s:lightline_ale_diagnostic('style_warning')
endfunction
" }}}
" Util {{{
" s:lightline_is_lean() {{{
function! s:lightline_is_lean() abort
  return &filetype =~? '\v^vim-plug|defx|mundo(diff)?$'
endfunction
" }}}
" s:lightline_is_plain() {{{
function! s:lightline_is_plain() abort
  return &buftype ==? 'terminal' || &filetype =~? '\v^help|denite|tagbar$'
endfunction
" }}}
" s:lightline_modified() {{{
function! s:lightline_modified() abort
  return s:lightline_is_lean() || s:lightline_is_plain() ?  ''  :
  \      &modified                                       ?  '' :
  \      &modifiable                                     ?  ''  : '-'
endfunction
" }}}
" s:lightline_readonly() {{{
function! s:lightline_readonly() abort
  return (s:lightline_is_lean() || s:lightline_is_plain()) && &filetype !=? 'help' ? '' : &readonly ? '' : ''
endfunction
" }}}
" s:lightline_patch_palette(colorscheme) {{{
function! s:lightline_patch_palette(colorscheme) abort
  try
    let palette = g:lightline#colorscheme#{a:colorscheme}#palette

    call add(palette.normal.left[0], 'bold')
    call add(palette.insert.left[0], 'bold')
    call add(palette.visual.left[0], 'bold')
    call add(palette.replace.left[0], 'bold')
  catch
  endtry
endfunction
" }}}
" s:lightline_coc_diagnostic(kind, sign) {{{
function! s:lightline_coc_diagnostic(kind, sign) abort
  if !get(g:, 'coc_enabled', 0)
    return ''
  endif
  let c = get(b:, 'coc_diagnostic_info', 0)
  if empty(c) || get(c, a:kind, 0) == 0
    return ''
  endif
  try
    let s = g:coc_user_config['diagnostic'][a:sign . 'Sign']
  catch
    let s = '!'
  endtry
  return printf('%d %s', c[a:kind], s)
endfunction
" }}}
" s:lightline_ale_diagnostic(kind) {{{
function! s:lightline_ale_diagnostic(kind) abort
  if !get(g:, 'ale_enabled', 0)
    return ''
  endif
  if !get(b:, 'ale_linted', 0)
    return ''
  endif
  if ale#engine#IsCheckingBuffer(bufnr(''))
    return ''
  endif
  let c = ale#statusline#Count(bufnr(''))
  if empty(c) || get(c, a:kind, 0) == 0
    return ''
  endif
  return printf('%d %s', c[a:kind], get(g:, 'ale_sign_' . a:kind, '!'))
endfunction
" }}}
" LightlineTagbarStatusFunc(current, sort, fname, ...) {{{
function! LightlineTagbarStatusFunc(current, sort, fname, ...) abort
  let g:lightline.fname = a:fname
  return lightline#statusline(0)
endfunction
let g:tagbar_status_func = 'LightlineTagbarStatusFunc'
" }}}
" }}}
call s:lightline_patch_palette(g:lightline.colorscheme)
autocmd vimrc ColorScheme * call s:lightline_patch_palette(g:lightline.colorscheme)
" }}}
" goyo.vim {{{
let g:goyo_width = 120

function! s:goyo_enter_pre() abort
  if !exists('g:color_backup')
    call s:backup_prior_patches()
    call s:apply_colorscheme_patches()
  endif
  let g:goyo_bg = g:color_backup_normal.bg
endfunction

autocmd vimrc User GoyoEnterPre nested call s:goyo_enter_pre()
" }}}
" Editing
" yaifa {{{
let g:yaifa_default_tabstop = 4
" }}}
" vim-lastplace {{{
let g:lastplace_open_folds = 0
" }}}
" Navigation
" tagbar {{{
" CSS {{{
let g:tagbar_type_css = {
\   'ctagstype' : 'css',
\   'kinds'     : [
\     'c:classes',
\     's:selectors',
\     'i:identities'
\   ]
\ }
" }}}
" Markdown {{{
let g:tagbar_type_markdown = {
\   'ctagstype' : 'markdown',
\   'kinds' : [
\     'h:Heading_L1',
\     'i:Heading_L2',
\     'k:Heading_L3'
\   ]
\ }
" }}}
" TypeScript {{{
let g:tagbar_type_typescript = {
\   'ctagsbin' : 'tstags',
\   'ctagsargs' : '-f-',
\   'kinds': [
\     'e:enums:0:1',
\     'f:function:0:1',
\     't:typealias:0:1',
\     'M:Module:0:1',
\     'I:import:0:1',
\     'i:interface:0:1',
\     'C:class:0:1',
\     'm:method:0:1',
\     'p:property:0:1',
\     'v:variable:0:1',
\     'c:const:0:1'
\   ],
\   'sort' : 0
\ }
" }}}
" }}}
" denite.nvim {{{
function! s:denite_config() abort
  call denite#custom#var('file_rec', 'command', ['rg', '--files', '--glob', '!.git'])
  call denite#custom#map('insert' , '<c-j>' , '<denite:move_to_next_line>'     , 'noremap')
  call denite#custom#map('insert' , '<c-k>' , '<denite:move_to_previous_line>' , 'noremap')
  call denite#custom#map('insert' , '<c-g>' , '<denite:insert_digraph>'        , 'noremap')
  call denite#custom#map('insert' , '<c-t>' , '<denite:input_command_line>'    , 'noremap')
  call denite#custom#alias('source' , 'buffer_proj'   , 'buffer')
  call denite#custom#alias('source' , 'file_mru_proj' , 'file_mru')
  call denite#custom#source('buffer_proj'   , 'matchers' , ['matcher/fuzzy' , 'matcher/project_files'])
  call denite#custom#source('file_mru_proj' , 'matchers' , ['matcher/fuzzy' , 'matcher/project_files'])
endfunction

autocmd vimrc VimEnter * if exists('g:loaded_denite') | call s:denite_config() | endif
" }}}
" Project Structure
" vim-obsession {{{
let g:obsession_no_bufenter = 1
" }}}
" vim-localvimrc {{{
let g:localvimrc_ask = 0
let g:localvimrc_sandbox = 0
" }}}
" editorconfig-vim {{{
let g:EditorConfig_max_line_indicator = 'none'
" }}}
" Source Control
" vim-gitgutter {{{
let g:gitgutter_sign_added = ''
let g:gitgutter_sign_removed = ''
let g:gitgutter_sign_modified = ''
let g:gitgutter_sign_modified_removed = ''
let g:gitgutter_override_sign_column_highlight = 0
autocmd vimrc VimEnter,ColorScheme *
\   call s:hi('GitGutterAdd',
\             s:fg('GitGutterAdd', 'gui'), s:bg('SignColumn', 'gui'),
\             s:fg('GitGutterAdd', 'cterm'), s:bg('SignColumn', 'cterm'))
\|  call s:hi('GitGutterChange',
\             s:fg('GitGutterChange', 'gui'), s:bg('SignColumn', 'gui'),
\             s:fg('GitGutterChange', 'cterm'), s:bg('SignColumn', 'cterm'))
\|  call s:hi('GitGutterDelete',
\             s:fg('GitGutterDelete', 'gui'), s:bg('SignColumn', 'gui'),
\             s:fg('GitGutterDelete', 'cterm'), s:bg('SignColumn', 'cterm'))
\|  call s:hi('GitGutterChangeDelete',
\             s:fg('GitGutterChangeDelete', 'gui'), s:bg('SignColumn', 'gui'),
\             s:fg('GitGutterChangeDelete', 'cterm'), s:bg('SignColumn', 'cterm'))
" }}}

" vim-quickrun {{{
let g:quickrun_config = {
\   '_': {
\     'outputter/buffer/close_on_empty': 1
\   },
\   'c' : {
\     'command': 'clang',
\     'cmdopt': '-g -O0 -Wall -Wextra -std=gnu11 -lpthread'
\   },
\   'cpp' : {
\     'command': 'clang++',
\     'cmdopt': '-g -O0 -Wall -Wextra -pedantic -std=c++17 -stdlib=libc++ -lc++abi -lpthread -I/opt/src/range-v3/include -I/opt/src/GSL/include'
\   },
\   'swift' : {
\     'command': 'swiftc',
\     'exec': ['%c %o %s -o %s:p:r', '%s:p:r %a'],
\     'tempfile': '%{tempname()}.swift',
\     'hook/sweep/files': ['%S:p:r']
\   },
\   'ocaml' : {
\     'command': 'corebuild',
\     'cmdopt': '-quiet',
\     'exec': ['%c %o %s:t:r.byte', './%s:t:r.byte %a'],
\     'tempfile': '%{tempname()}.ml',
\     'hook/cd/directory': '%S:p:h'
\   },
\   'dats' : {
\     'command': 'patscc',
\     'cmdopt': '-cleanaft',
\     'exec': ['%c %o %s -o %s:p:r', '%s:p:r %a'],
\     'tempfile': '%{tempname()}.dats',
\     'hook/sweep/files': ['%S:p:r']
\   },
\   'rust' : {
\     'command': 'cargo',
\     'cmdopt': 'run --quiet',
\     'exec': ['%c %o']
\   }
\ }
" }}}
" Exporting
" gist-vim {{{
let g:gist_put_url_to_clipboard_after_post = 1
" }}}

" Diagnostics
" ale {{{
" Disable linters that conflict with coc.nvim
" (and other annoying ones)
let g:ale_linters = {
\   'c': [], 'cpp': [], 'go': [], 'rust': [], 'python': [], 'sh': [],
\   'html': [], 'css': [], 'javascript': [], 'typescript': [], 'reason': [],
\   'json': [], 'vue': []
\ }
let g:ale_linters_ignore = {
\   'tex': ['lacheck']
\ }

let g:ale_sign_info = ''
let g:ale_sign_error = ''
let g:ale_sign_warning = ''
let g:ale_sign_style_error = ''
let g:ale_sign_style_warning = ''

autocmd vimrc User ALEJobStarted call lightline#update()
autocmd vimrc User ALELintPost   call lightline#update()
autocmd vimrc User ALEFixPost    call lightline#update()

" Diagnostic's highlighting {{{
function! s:ale_highlight() abort
  hi! link ALEErrorLine SignColumn
  hi! link ALEWarningLine SignColumn
  hi! link ALEInfoLine SignColumn
  if exists('g:loaded_lightline')
    let c = g:lightline#palette().normal.error[0]
    let i = s:farthest_color(s:bg('ALEErrorLine', 'gui'), c[:1])
    call s:hi('ALEErrorSign', c[0+i], s:bg('ALEErrorLine', 'gui')
         \                  , c[2+i], s:bg('ALEErrorLine', 'cterm'))
    let c = g:lightline#palette().normal.warning[0]
    let i = s:farthest_color(s:bg('ALEWarningLine', 'gui'), c[:1])
    call s:hi('ALEWarningSign', c[0+i], s:bg('ALEWarningLine', 'gui')
         \                   , c[2+i], s:bg('ALEWarningLine', 'cterm'))
    let c = g:lightline#palette().tabline.tabsel[0]
    let i = s:farthest_color(s:bg('ALEInfoLine', 'gui'), c[:1])
    call s:hi('ALEInfoSign', c[0+i], s:bg('ALEInfoLine', 'gui')
         \                 , c[2+i], s:bg('ALEInfoLine', 'cterm'))
  else
    call s:hi('ALEErrorSign'   , 'lightred'  , s:bg('ALEErrorLine'   , 'gui')
         \                     , 'lightred'  , s:bg('ALEErrorLine'   , 'cterm'))
    call s:hi('ALEWarningSign' , 'yellow'    , s:bg('ALEWarningLine' , 'gui')
         \                     , 'yellow'    , s:bg('ALEWarningLine' , 'cterm'))
    call s:hi('ALEInfoSign'    , 'lightblue' , s:bg('ALEInfoLine'    , 'gui')
         \                     , 'lightblue' , s:bg('ALEInfoLine'    , 'cterm'))
  endif
endfunction

autocmd vimrc VimEnter,ColorScheme * call s:ale_highlight()
" }}}
" }}}
" coc.nvim {{{
function! s:coc_config() abort
  let root_patterns = ['.vim/', '.git/', '.hg/', '.projections.json']

  let g:coc_status_error_sign = ''
  let g:coc_status_warning_sign = ''

  call coc#config('suggest', {
  \   'snippetIndicator' :' ',
  \   'messageLevel': 'warning'
  \ })

  call coc#config('diagnostic', {
  \   'errorSign'  : '',
  \   'warningSign': '',
  \   'infoSign'   : '',
  \   'hintSign'   : 'ﯦ'
  \ })

  let languageservers = {}

  if executable('ccls')
    let languageservers['ccls'] = {
    \   'command': 'ccls',
    \   'filetypes': ['c', 'cpp', 'objc', 'objcpp'],
    \   'rootPatterns': ['.ccls', 'compile_commands.json'] + root_patterns,
    \   "initializationOptions": {
    \     "cache": {
    \       "directory": "/tmp/.ccls-cache"
    \     }
    \   }
    \ }
  endif

  if !empty(languageservers)
    call coc#config('languageserver', languageservers)
  endif
endfunction

autocmd vimrc VimEnter * if exists('g:did_coc_loaded') | call s:coc_config() | endif

autocmd vimrc User CocJumpPlaceholder call CocActionAsync('showSignatureHelp')

" Diagnostic's feedback {{{
function! CocUpdateQuickFixes(error, actions) abort
  let coc_quickfixes = {}
  try
    for action in a:actions
      if action.kind ==? 'quickfix'
        for change in action.edit.documentChanges
          for edit in change.edits
            let start_line = edit.range.start.line + 1
            let end_line = edit.range.end.line + 1
            let coc_quickfixes[start_line] = get(coc_quickfixes, start_line, 0) + 1
            if start_line != end_line
              let coc_quickfixes[end_line] = get(coc_quickfixes, end_line, 0) + 1
            endif
          endfor
        endfor
      endif
    endfor
  catch
  endtry
  if coc_quickfixes != get(b:, 'coc_quickfixes', {})
    let b:coc_quickfixes = coc_quickfixes
    call lightline#update()
  endif
endfunction

autocmd vimrc User CocDiagnosticChange
\   call lightline#update()
\|  call CocActionAsync('quickfixes', function('CocUpdateQuickFixes'))

function! s:coc_fix_on_cursor_moved() abort
  let current_line = line('.')
  if current_line != get(b:, 'last_line', 0)
    let b:last_line = current_line
    if has_key(get(b:, 'coc_quickfixes', {}), current_line)
      call lightline#update()
    else
      if get(b:, 'coc_line_fixes', 0) > 0
        call lightline#update()
      endif
    endif
  endif
endfunction

autocmd vimrc CursorMoved * call s:coc_fix_on_cursor_moved()
" }}}
" Diagnostic's highlighting {{{
function! s:coc_highlight() abort
  hi! link CocHighlightText Search
  hi! link CocErrorLine SignColumn
  hi! link CocWarningLine SignColumn
  hi! link CocInfoLine SignColumn
  hi! link CocHintLine SignColumn
  if exists('g:loaded_lightline')
    let c = g:lightline#palette().normal.error[0]
    let i = s:farthest_color(s:bg('CocErrorLine', 'gui'), c[:1])
    call s:hi('CocErrorSign', c[0+i], s:bg('CocErrorLine', 'gui')
         \                  , c[2+i], s:bg('CocErrorLine', 'cterm'))
    let c = g:lightline#palette().normal.warning[0]
    let i = s:farthest_color(s:bg('CocWarningLine', 'gui'), c[:1])
    call s:hi('CocWarningSign', c[0+i], s:bg('CocWarningLine', 'gui')
         \                    , c[2+i], s:bg('CocWarningLine', 'cterm'))
    let c = g:lightline#palette().tabline.tabsel[0]
    let i = s:farthest_color(s:bg('CocInfoLine', 'gui'), c[:1])
    call s:hi('CocInfoSign', c[0+i], s:bg('CocInfoLine', 'gui')
         \                 , c[2+i], s:bg('CocInfoLine', 'cterm'))
    call s:hi('CocHintSign', g:lightline#palette().tabline.tabsel[0][0]
         \                 , s:bg('CocHintLine', 'gui')
         \                 , g:lightline#palette().tabline.tabsel[0][2]
         \                 , s:bg('CocHintLine', 'cterm'))
  else
    call s:hi('CocErrorSign'   , 'lightred'  , s:bg('CocErrorLine'   , 'gui')
         \                     , 'lightred'  , s:bg('CocErrorLine'   , 'cterm'))
    call s:hi('CocWarningSign' , 'yellow'    , s:bg('CocWarningLine' , 'gui')
         \                     , 'yellow'    , s:bg('CocWarningLine' , 'cterm'))
    call s:hi('CocInfoSign'    , 'lightblue' , s:bg('CocInfoLine'    , 'gui')
         \                     , 'lightblue' , s:bg('CocInfoLine'    , 'cterm'))
    call s:hi('CocHintSign'    , 'cyan'      , s:bg('CocHintLine'    , 'gui')
         \                     , 'cyan'      , s:bg('CocHintLine'    , 'cterm'))
  endif
endfunction