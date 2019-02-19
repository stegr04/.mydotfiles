let SessionLoad = 1
if &cp | set nocp | endif
let s:cpo_save=&cpo
set cpo&vim
inoremap <D-BS> 
inoremap <M-BS> 
inoremap <M-Down> }
inoremap <D-Down> <C-End>
inoremap <M-Up> {
inoremap <D-Up> <C-Home>
noremap! <M-Right> <C-Right>
noremap! <D-Right> <End>
noremap! <M-Left> <C-Left>
noremap! <D-Left> <Home>
imap <F5> <Plug>ToggleBackground
noremap  h
noremap <NL> j
noremap  k
noremap  l
map  <Plug>(ctrlp)
nnoremap <silent> ,v :NERDTreeFind
nnoremap ,f :NERDTreeToggle
nnoremap ,ec :source ~/.mydotfiles/mycase-files.vim
nnoremap ,eb :source ~/.mydotfiles/mybin-files.vim
nnoremap ,ez :source ~/.mydotfiles/myzsh-plugins.vim
nnoremap ,sv :source $MYVIMRC
nnoremap ,ev :source ~/.mydotfiles/myvim-files.vim
nnoremap ;; :ls
xmap S <Plug>VSurround
nmap cS <Plug>CSurround
nmap cs <Plug>Csurround
nmap ds <Plug>Dsurround
vmap gx <Plug>NetrwBrowseXVis
nmap gx <Plug>NetrwBrowseX
xmap gS <Plug>VgSurround
nmap ySS <Plug>YSsurround
nmap ySs <Plug>YSsurround
nmap yss <Plug>Yssurround
nmap yS <Plug>YSurround
nmap ys <Plug>Ysurround
nnoremap <SNR>86_: :=v:count ? v:count : ''
noremap <M-Down> }
noremap <D-Down> <C-End>
noremap <M-Up> {
noremap <D-Up> <C-Home>
noremap <M-Right> <C-Right>
noremap <D-Right> <End>
noremap <M-Left> <C-Left>
noremap <D-Left> <Home>
vnoremap <silent> <Plug>NetrwBrowseXVis :call netrw#BrowseXVis()
nnoremap <silent> <Plug>NetrwBrowseX :call netrw#BrowseX(expand((exists("g:netrw_gx")? g:netrw_gx : '<cfile>')),netrw#CheckIfRemote())
vmap <F5> <Plug>ToggleBackground
nmap <F5> <Plug>ToggleBackground
nnoremap <silent> <Plug>(ctrlp) :CtrlP
nnoremap <silent> <Plug>SurroundRepeat .
nnoremap <expr> <Plug>BashSupportSetBashSyntaxOpts ':BashSyntaxCheckOptions '.( exists( 'b:BASH_SyntaxCheckOptionsLocal' ) ? b:BASH_SyntaxCheckOptionsLocal : '' )
nnoremap <expr> <Plug>BashSupportSetBashInterpArgs ':BashInterpArguments '.   ( exists( 'b:BASH_InterpCmdLineArgs' )       ? b:BASH_InterpCmdLineArgs       : '' )
nnoremap <expr> <Plug>BashSupportSetBashScriptArgs ':BashScriptArguments '.   ( exists( 'b:BASH_ScriptCmdLineArgs' )       ? b:BASH_ScriptCmdLineArgs       : '' )
nnoremap <F10> :b 
vmap <BS> "-d
imap S <Plug>ISurround
imap s <Plug>Isurround
imap  <Plug>Isurround
inoremap  <Nop>
inoremap jk 
let &cpo=s:cpo_save
unlet s:cpo_save
set backspace=indent,eol,start
set fileencodings=ucs-bom,utf-8,default,latin1
set guitablabel=%M%t
set helplang=en
set langmenu=none
set laststatus=2
set mouse=a
set printexpr=system('open\ -a\ Preview\ '.v:fname_in)\ +\ v:shell_error
set runtimepath=
set runtimepath+=~/.vim
set runtimepath+=~/.vim/bundle/Vundle.vim
set runtimepath+=~/.vim/bundle/vim-fugitive
set runtimepath+=~/.vim/bundle/nerdtree
set runtimepath+=~/.vim/bundle/nerdtree-custom
set runtimepath+=~/.vim/bundle/bash-support
set runtimepath+=~/.vim/bundle/bash-support-custom
set runtimepath+=~/.vim/bundle/vim-surround
set runtimepath+=~/.vim/bundle/ctrlp.vim
set runtimepath+=~/.vim/bundle/vim-airline
set runtimepath+=~/.vim/bundle/vim-airline-themes
set runtimepath+=~/.vim/bundle/vim-colors-solarized
set runtimepath+=~/.vim/bundle/vim-colors-solarized-custom
set runtimepath+=~/.vim/bundle/vim-bufferline
set runtimepath+=/usr/local/Cellar/macvim/8.1-151/MacVim.app/Contents/Resources/vim/vimfiles
set runtimepath+=/usr/local/Cellar/macvim/8.1-151/MacVim.app/Contents/Resources/vim/runtime
set runtimepath+=/usr/local/Cellar/macvim/8.1-151/MacVim.app/Contents/Resources/vim/vimfiles/after
set runtimepath+=~/.vim/after
set runtimepath+=~/.vim/bundle/Vundle.vim/after
set runtimepath+=~/.vim/bundle/vim-fugitive/after
set runtimepath+=~/.vim/bundle/nerdtree/after
set runtimepath+=~/.vim/bundle/nerdtree-custom/after
set runtimepath+=~/.vim/bundle/bash-support/after
set runtimepath+=~/.vim/bundle/bash-support-custom/after
set runtimepath+=~/.vim/bundle/vim-surround/after
set runtimepath+=~/.vim/bundle/ctrlp.vim/after
set runtimepath+=~/.vim/bundle/vim-airline/after
set runtimepath+=~/.vim/bundle/vim-airline-themes/after
set runtimepath+=~/.vim/bundle/vim-colors-solarized/after
set runtimepath+=~/.vim/bundle/vim-colors-solarized-custom/after
set runtimepath+=~/.vim/bundle/vim-bufferline/after
set statusline=%02n:%<%f\ %h%m%r=%-14.(%l,%c%V%)\ %P
set termencoding=utf-8
set wildcharm=26
set wildmenu
let s:so_save = &so | let s:siso_save = &siso | set so=0 siso=0
let v:this_session=expand("<sfile>:p")
silent only
silent tabonly
cd ~/.mydotfiles
if expand('%') == '' && !&modified && line('$') <= 1 && getline(1) == ''
  let s:wipebuf = bufnr('%')
endif
set shortmess=aoO
argglobal
%argdel
edit ~/.mydotfiles/plugins/myzsh/.zshrc
set splitbelow splitright
set nosplitbelow
set nosplitright
wincmd t
set winminheight=0
set winheight=1
set winminwidth=0
set winwidth=1
argglobal
setlocal keymap=
setlocal noarabic
setlocal noautoindent
setlocal backupcopy=
setlocal balloonexpr=
setlocal nobinary
setlocal nobreakindent
setlocal breakindentopt=
setlocal bufhidden=
setlocal buflisted
setlocal buftype=
setlocal nocindent
setlocal cinkeys=0{,0},0),0],:,0#,!^F,o,O,e
setlocal cinoptions=
setlocal cinwords=if,else,while,do,for,switch
setlocal colorcolumn=
setlocal comments=:#
setlocal commentstring=#\ %s
setlocal complete=.,w,b,u,t,i
setlocal concealcursor=
setlocal conceallevel=0
setlocal completefunc=
setlocal nocopyindent
setlocal cryptmethod=
setlocal nocursorbind
setlocal nocursorcolumn
setlocal nocursorline
setlocal define=
setlocal dictionary=
setlocal nodiff
setlocal equalprg=
setlocal errorformat=
setlocal noexpandtab
if &filetype != 'zsh'
setlocal filetype=zsh
endif
setlocal fixendofline
setlocal foldcolumn=0
setlocal foldenable
setlocal foldexpr=0
setlocal foldignore=#
setlocal foldlevel=0
setlocal foldmarker={{{,}}}
setlocal foldmethod=manual
setlocal foldminlines=1
setlocal foldnestmax=20
setlocal foldtext=foldtext()
setlocal formatexpr=
setlocal formatoptions=croql
setlocal formatlistpat=^\\s*\\d\\+[\\]:.)}\\t\ ]\\s*
setlocal formatprg=
setlocal grepprg=
setlocal iminsert=0
setlocal imsearch=-1
setlocal include=
setlocal includeexpr=
setlocal indentexpr=GetShIndent()
setlocal indentkeys=0{,0},0),0],!^F,o,O,e,0=then,0=do,0=else,0=elif,0=fi,0=esac,0=done,0=end,),0=;;,0=;&,0=fin,0=fil,0=fip,0=fir,0=fix
setlocal noinfercase
setlocal iskeyword=@,48-57,_,192-255
setlocal keywordprg=
setlocal nolinebreak
setlocal nolisp
setlocal lispwords=
setlocal nolist
setlocal nomacmeta
setlocal makeencoding=
setlocal makeprg=
setlocal matchpairs=(:),{:},[:]
setlocal modeline
setlocal modifiable
setlocal nrformats=bin,octal,hex
set number
setlocal number
setlocal numberwidth=4
setlocal omnifunc=
setlocal path=
setlocal nopreserveindent
setlocal nopreviewwindow
setlocal quoteescape=\\
setlocal noreadonly
setlocal norelativenumber
setlocal norightleft
setlocal rightleftcmd=search
setlocal noscrollbind
setlocal scrolloff=-1
setlocal shiftwidth=8
setlocal noshortname
setlocal sidescrolloff=-1
setlocal signcolumn=auto
setlocal nosmartindent
setlocal softtabstop=0
setlocal nospell
setlocal spellcapcheck=[.?!]\\_[\\])'\"\	\ ]\\+
setlocal spellfile=
setlocal spelllang=en
setlocal statusline=%!airline#statusline(1)
setlocal suffixesadd=
setlocal swapfile
setlocal synmaxcol=3000
if &syntax != 'zsh'
setlocal syntax=zsh
endif
setlocal tabstop=8
setlocal tagcase=
setlocal tags=
setlocal termmode=
setlocal termwinkey=
setlocal termwinscroll=10000
setlocal termwinsize=
setlocal textwidth=0
setlocal thesaurus=
setlocal noundofile
setlocal undolevels=-123456
setlocal varsofttabstop=
setlocal vartabstop=
setlocal nowinfixheight
setlocal nowinfixwidth
setlocal wrap
setlocal wrapmargin=0
silent! normal! zE
let s:l = 1 - ((0 * winheight(0) + 35) / 70)
if s:l < 1 | let s:l = 1 | endif
exe s:l
normal! zt
1
normal! 0
tabnext 1
badd +1 ~/.mydotfiles/plugins/releaseauto/releaseauto.plugin.zsh
badd +1 ~/.zshrc
badd +1 ~/.mydotfiles/plugins/mybin/mybin.plugin.zsh
badd +1 ~/.mydotfiles/plugins/mygit/mygit.plugin.zsh
badd +4 ~/.mydotfiles/plugins/myvim/myvim.plugin.zsh
badd +43 ~/.mydotfiles/plugins/myzsh/myzsh.plugin.zsh
badd +0 ~/.mydotfiles/plugins/myzsh/.zshrc
if exists('s:wipebuf') && len(win_findbuf(s:wipebuf)) == 0
  silent exe 'bwipe ' . s:wipebuf
endif
unlet! s:wipebuf
set winheight=1 winwidth=20 shortmess=filnxtToO
set winminheight=1 winminwidth=1
let s:sx = expand("<sfile>:p:r")."x.vim"
if file_readable(s:sx)
  exe "source " . fnameescape(s:sx)
endif
let &so = s:so_save | let &siso = s:siso_save
doautoall SessionLoadPost
unlet SessionLoad
" vim: set ft=vim :
