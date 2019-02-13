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
map  <Plug>(ctrlp)
nnoremap <silent> ,v :NERDTreeFind
nnoremap ,f :NERDTreeToggle
nnoremap ,sb :source ~/.mydotfiles/mybin-files.vim
nnoremap ,sc :source ~/.mydotfiles/mycase-files.vim
nnoremap ,sm :source ~/.mydotfiles/myzsh-files.vim
nnoremap ,sv :source $MYVIMRC
nnoremap ,ev :vsplit $MYVIMRC
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
set background=dark
set backspace=indent,eol,start
set fileencodings=ucs-bom,utf-8,default,latin1
set guitablabel=%M%t
set helplang=en
set langmenu=none
set laststatus=2
set mouse=a
set printexpr=system('open\ -a\ Preview\ '.v:fname_in)\ +\ v:shell_error
set runtimepath=~/.vim,~/.vim/bundle/Vundle.vim,~/.vim/bundle/nerdtree,~/.vim/bundle/bash-support,~/.vim/bundle/vim-surround,~/.vim/bundle/bash-support-custom,~/.vim/bundle/nerdtree-custom,~/.vim/bundle/ctrlp.vim,~/.vim/bundle/vim-airline,~/.vim/bundle/vim-airline-themes,~/.vim/bundle/vim-colors-solarized,~/.vim/bundle/Vundle.vim,~/.vim/bundle/nerdtree,~/.vim/bundle/bash-support,~/.vim/bundle/vim-surround,~/.vim/bundle/bash-support-custom,~/.vim/bundle/nerdtree-custom,/usr/local/Cellar/macvim/8.1-151/MacVim.app/Contents/Resources/vim/vimfiles,/usr/local/Cellar/macvim/8.1-151/MacVim.app/Contents/Resources/vim/runtime,/usr/local/Cellar/macvim/8.1-151/MacVim.app/Contents/Resources/vim/vimfiles/after,~/.vim/after,~/.mydotfiles/plugins/vim/.vim/bundle/Vundle.vim,~/.vim/bundle/Vundle.vim/after,~/.vim/bundle/nerdtree/after,~/.vim/bundle/bash-support/after,~/.vim/bundle/vim-surround/after,~/.vim/bundle/bash-support-custom/after,~/.vim/bundle/nerdtree-custom/after,~/.vim/bundle/Vundle.vim/after,~/.vim/bundle/nerdtree/after,~/.vim/bu
set statusline=%02n:%<%f\ %h%m%r=%-14.(%l,%c%V%)\ %P
set termencoding=utf-8
set wildcharm=26
set wildmenu
set window=71
let s:so_save = &so | let s:siso_save = &siso | set so=0 siso=0
let v:this_session=expand("<sfile>:p")
silent only
silent tabonly
cd ~/.mydotfiles/plugins/vim/.vim/bundle
if expand('%') == '' && !&modified && line('$') <= 1 && getline(1) == ''
  let s:wipebuf = bufnr('%')
endif
set shortmess=aoO
badd +38 ~/bin/newcase.sh
badd +31 ~/bin/setscreenshot.sh
badd +32 ~/opt/ReleaseAutomationAnalysis/helperLib.sh
badd +1 ~/bin/restoreOracle11DB.sh
badd +1 ~/bin/restoreOracle12DB.sh
argglobal
silent! argdel *
$argadd ~/tmp/testabc.sh
edit ~/bin/newcase.sh
set splitbelow splitright
set nosplitbelow
set nosplitright
wincmd t
set winminheight=0
set winheight=1
set winminwidth=0
set winwidth=1
argglobal
nnoremap <buffer> <silent>  :call mmtemplates#core#DeleteOptTag('\[-\w*-]\|\[+\w*+]',',',"n")
nnoremap <buffer> <silent> \eyw :call BASH_EchoWithColorUnderlineWord("yellow")
nnoremap <buffer> <silent> \egw :call BASH_EchoWithColorUnderlineWord("green")
nnoremap <buffer> <silent> \erw :call BASH_EchoWithColorUnderlineWord("red")
nnoremap <buffer> <silent> \eyu :call BASH_EchoWithColorAndUnderline("yellow")
nnoremap <buffer> <silent> \egu :call BASH_EchoWithColorAndUnderline("green")
nnoremap <buffer> <silent> \eru :call BASH_EchoWithColorAndUnderline("red")
nnoremap <buffer> <silent> \ey :call BASH_EchoWithColor("yellow")
nnoremap <buffer> <silent> \eg :call BASH_EchoWithColor("green")
nnoremap <buffer> <silent> \er :call BASH_EchoWithColor("red")
nnoremap <buffer> <silent> \rp :call BASH_Readprompt()
vnoremap <buffer> <silent> \eyw :call BASH_EchoWithColorUnderlineWord("yellow")
vnoremap <buffer> <silent> \egw :call BASH_EchoWithColorUnderlineWord("green")
vnoremap <buffer> <silent> \erw :call BASH_EchoWithColorUnderlineWord("red")
vnoremap <buffer> <silent> \eyu :call BASH_EchoWithColorAndUnderline("yellow")
vnoremap <buffer> <silent> \egu :call BASH_EchoWithColorAndUnderline("green")
vnoremap <buffer> <silent> \eru :call BASH_EchoWithColorAndUnderline("red")
vnoremap <buffer> <silent> \ey :call BASH_EchoWithColor("yellow")
vnoremap <buffer> <silent> \eg :call BASH_EchoWithColor("green")
vnoremap <buffer> <silent> \er :call BASH_EchoWithColor("red")
vnoremap <buffer> <silent> \rp :call BASH_Readprompt()
onoremap <buffer> <silent> \eyw :call BASH_EchoWithColorUnderlineWord("yellow")
onoremap <buffer> <silent> \egw :call BASH_EchoWithColorUnderlineWord("green")
onoremap <buffer> <silent> \erw :call BASH_EchoWithColorUnderlineWord("red")
onoremap <buffer> <silent> \eyu :call BASH_EchoWithColorAndUnderline("yellow")
onoremap <buffer> <silent> \egu :call BASH_EchoWithColorAndUnderline("green")
onoremap <buffer> <silent> \eru :call BASH_EchoWithColorAndUnderline("red")
onoremap <buffer> <silent> \ey :call BASH_EchoWithColor("yellow")
onoremap <buffer> <silent> \eg :call BASH_EchoWithColor("green")
onoremap <buffer> <silent> \er :call BASH_EchoWithColor("red")
onoremap <buffer> <silent> \rp :call BASH_Readprompt()
vnoremap <buffer> <silent> \nts :call mmtemplates#core#ChooseStyle(g:BASH_Templates,"!pick")
nnoremap <buffer> <silent> \nts :call mmtemplates#core#ChooseStyle(g:BASH_Templates,"!pick")
vnoremap <buffer> <silent> \ntw :call mmtemplates#wizard#SetupWizard(g:BASH_Templates)
nnoremap <buffer> <silent> \ntw :call mmtemplates#wizard#SetupWizard(g:BASH_Templates)
vnoremap <buffer> <silent> \ntr :call mmtemplates#core#ReadTemplates(g:BASH_Templates,"reload","all")
nnoremap <buffer> <silent> \ntr :call mmtemplates#core#ReadTemplates(g:BASH_Templates,"reload","all")
vnoremap <buffer> <silent> \ntc :call mmtemplates#core#EditTemplateFiles(g:BASH_Templates,2)
nnoremap <buffer> <silent> \ntc :call mmtemplates#core#EditTemplateFiles(g:BASH_Templates,2)
vnoremap <buffer> <silent> \ntp :call mmtemplates#core#EditTemplateFiles(g:BASH_Templates,1)
nnoremap <buffer> <silent> \ntp :call mmtemplates#core#EditTemplateFiles(g:BASH_Templates,1)
vnoremap <buffer> <silent> \ntl :call mmtemplates#core#EditTemplateFiles(g:BASH_Templates,0)
nnoremap <buffer> <silent> \ntl :call mmtemplates#core#EditTemplateFiles(g:BASH_Templates,0)
vnoremap <buffer> <silent> \he :call mmtemplates#core#InsertTemplate(g:BASH_Templates,"Help.English")
nnoremap <buffer> <silent> \he :call mmtemplates#core#InsertTemplate(g:BASH_Templates,"Help.English")
vnoremap <buffer> <silent> \pbr :call mmtemplates#core#InsertTemplate(g:BASH_Templates,"PatternMatching.BASH_REMATCH")
nnoremap <buffer> <silent> \pbr :call mmtemplates#core#InsertTemplate(g:BASH_Templates,"PatternMatching.BASH_REMATCH")
vnoremap <buffer> <silent> \ppc :call mmtemplates#core#InsertTemplate(g:BASH_Templates,"PatternMatching.POSIX classes")
nnoremap <buffer> <silent> \ppc :call mmtemplates#core#InsertTemplate(g:BASH_Templates,"PatternMatching.POSIX classes")
vnoremap <buffer> <silent> \pae :call mmtemplates#core#InsertTemplate(g:BASH_Templates,"PatternMatching.anything except","v")
nnoremap <buffer> <silent> \pae :call mmtemplates#core#InsertTemplate(g:BASH_Templates,"PatternMatching.anything except")
vnoremap <buffer> <silent> \peo :call mmtemplates#core#InsertTemplate(g:BASH_Templates,"PatternMatching.exactly one","v")
nnoremap <buffer> <silent> \peo :call mmtemplates#core#InsertTemplate(g:BASH_Templates,"PatternMatching.exactly one")
vnoremap <buffer> <silent> \pom :call mmtemplates#core#InsertTemplate(g:BASH_Templates,"PatternMatching.one or more","v")
nnoremap <buffer> <silent> \pom :call mmtemplates#core#InsertTemplate(g:BASH_Templates,"PatternMatching.one or more")
vnoremap <buffer> <silent> \pzm :call mmtemplates#core#InsertTemplate(g:BASH_Templates,"PatternMatching.zero or more","v")
nnoremap <buffer> <silent> \pzm :call mmtemplates#core#InsertTemplate(g:BASH_Templates,"PatternMatching.zero or more")
vnoremap <buffer> <silent> \pzo :call mmtemplates#core#InsertTemplate(g:BASH_Templates,"PatternMatching.zero or one","v")
nnoremap <buffer> <silent> \pzo :call mmtemplates#core#InsertTemplate(g:BASH_Templates,"PatternMatching.zero or one")
vnoremap <buffer> <silent> \ioh :call mmtemplates#core#InsertTemplate(g:BASH_Templates,"IO-Redir.here-document","v")
nnoremap <buffer> <silent> \ioh :call mmtemplates#core#InsertTemplate(g:BASH_Templates,"IO-Redir.here-document")
vnoremap <buffer> <silent> \ior :call mmtemplates#core#InsertTemplate(g:BASH_Templates,"IO-Redir.redir")
nnoremap <buffer> <silent> \ior :call mmtemplates#core#InsertTemplate(g:BASH_Templates,"IO-Redir.redir")
vnoremap <buffer> <silent> \bso :call mmtemplates#core#InsertTemplate(g:BASH_Templates,"Shopts")
nnoremap <buffer> <silent> \bso :call mmtemplates#core#InsertTemplate(g:BASH_Templates,"Shopts")
vnoremap <buffer> <silent> \bse :call mmtemplates#core#InsertTemplate(g:BASH_Templates,"Set")
nnoremap <buffer> <silent> \bse :call mmtemplates#core#InsertTemplate(g:BASH_Templates,"Set")
vnoremap <buffer> <silent> \bbu :call mmtemplates#core#InsertTemplate(g:BASH_Templates,"Builtins")
nnoremap <buffer> <silent> \bbu :call mmtemplates#core#InsertTemplate(g:BASH_Templates,"Builtins")
vnoremap <buffer> <silent> \ben :call mmtemplates#core#InsertTemplate(g:BASH_Templates,"Environment")
nnoremap <buffer> <silent> \ben :call mmtemplates#core#InsertTemplate(g:BASH_Templates,"Environment")
vnoremap <buffer> <silent> \bsp :call mmtemplates#core#InsertTemplate(g:BASH_Templates,"SpecParams")
nnoremap <buffer> <silent> \bsp :call mmtemplates#core#InsertTemplate(g:BASH_Templates,"SpecParams")
vnoremap <buffer> <silent> \bps :call mmtemplates#core#InsertTemplate(g:BASH_Templates,"ParamSub")
nnoremap <buffer> <silent> \bps :call mmtemplates#core#InsertTemplate(g:BASH_Templates,"ParamSub")
vnoremap <buffer> <silent> \tm :call mmtemplates#core#InsertTemplate(g:BASH_Templates,"Tests.string matches regexp")
nnoremap <buffer> <silent> \tm :call mmtemplates#core#InsertTemplate(g:BASH_Templates,"Tests.string matches regexp")
vnoremap <buffer> <silent> \tfd :call mmtemplates#core#InsertTemplate(g:BASH_Templates,"Tests.file descriptor is open, refers to a terminal, -t")
nnoremap <buffer> <silent> \tfd :call mmtemplates#core#InsertTemplate(g:BASH_Templates,"Tests.file descriptor is open, refers to a terminal, -t")
vnoremap <buffer> <silent> \tvs :call mmtemplates#core#InsertTemplate(g:BASH_Templates,"Tests.variable has been set, -v")
nnoremap <buffer> <silent> \tvs :call mmtemplates#core#InsertTemplate(g:BASH_Templates,"Tests.variable has been set, -v")
vnoremap <buffer> <silent> \toe :call mmtemplates#core#InsertTemplate(g:BASH_Templates,"Tests.option is enabled, -o")
nnoremap <buffer> <silent> \toe :call mmtemplates#core#InsertTemplate(g:BASH_Templates,"Tests.option is enabled, -o")
vnoremap <buffer> <silent> \ts :call mmtemplates#core#InsertTemplate(g:BASH_Templates,"Tests.string comparison")
nnoremap <buffer> <silent> \ts :call mmtemplates#core#InsertTemplate(g:BASH_Templates,"Tests.string comparison")
vnoremap <buffer> <silent> \tfc :call mmtemplates#core#InsertTemplate(g:BASH_Templates,"Tests.file characteristics")
nnoremap <buffer> <silent> \tfc :call mmtemplates#core#InsertTemplate(g:BASH_Templates,"Tests.file characteristics")
vnoremap <buffer> <silent> \tft :call mmtemplates#core#InsertTemplate(g:BASH_Templates,"Tests.file types")
nnoremap <buffer> <silent> \tft :call mmtemplates#core#InsertTemplate(g:BASH_Templates,"Tests.file types")
vnoremap <buffer> <silent> \tfp :call mmtemplates#core#InsertTemplate(g:BASH_Templates,"Tests.file permissions")
nnoremap <buffer> <silent> \tfp :call mmtemplates#core#InsertTemplate(g:BASH_Templates,"Tests.file permissions")
vnoremap <buffer> <silent> \ta :call mmtemplates#core#InsertTemplate(g:BASH_Templates,"Tests.arithmetic tests")
nnoremap <buffer> <silent> \ta :call mmtemplates#core#InsertTemplate(g:BASH_Templates,"Tests.arithmetic tests")
vnoremap <buffer> <silent> \sai :call mmtemplates#core#InsertTemplate(g:BASH_Templates,"Statements.array indices","v")
nnoremap <buffer> <silent> \sai :call mmtemplates#core#InsertTemplate(g:BASH_Templates,"Statements.array indices")
vnoremap <buffer> <silent> \san :call mmtemplates#core#InsertTemplate(g:BASH_Templates,"Statements.no of element","v")
nnoremap <buffer> <silent> \san :call mmtemplates#core#InsertTemplate(g:BASH_Templates,"Statements.no of element")
vnoremap <buffer> <silent> \ssa :call mmtemplates#core#InsertTemplate(g:BASH_Templates,"Statements.subarray","v")
nnoremap <buffer> <silent> \ssa :call mmtemplates#core#InsertTemplate(g:BASH_Templates,"Statements.subarray")
vnoremap <buffer> <silent> \sas :call mmtemplates#core#InsertTemplate(g:BASH_Templates,"Statements.array elements, string","v")
nnoremap <buffer> <silent> \sas :call mmtemplates#core#InsertTemplate(g:BASH_Templates,"Statements.array elements, string")
vnoremap <buffer> <silent> \saa :call mmtemplates#core#InsertTemplate(g:BASH_Templates,"Statements.array elements, all","v")
nnoremap <buffer> <silent> \saa :call mmtemplates#core#InsertTemplate(g:BASH_Templates,"Statements.array elements, all")
vnoremap <buffer> <silent> \sae :call mmtemplates#core#InsertTemplate(g:BASH_Templates,"Statements.array element","v")
nnoremap <buffer> <silent> \sae :call mmtemplates#core#InsertTemplate(g:BASH_Templates,"Statements.array element")
vnoremap <buffer> <silent> \sp :call mmtemplates#core#InsertTemplate(g:BASH_Templates,"Statements.printf","v")
nnoremap <buffer> <silent> \sp :call mmtemplates#core#InsertTemplate(g:BASH_Templates,"Statements.printf")
vnoremap <buffer> <silent> \se :call mmtemplates#core#InsertTemplate(g:BASH_Templates,"Statements.echo","v")
nnoremap <buffer> <silent> \se :call mmtemplates#core#InsertTemplate(g:BASH_Templates,"Statements.echo")
vnoremap <buffer> <silent> \sfu :call mmtemplates#core#InsertTemplate(g:BASH_Templates,"Statements.function","v")
nnoremap <buffer> <silent> \sfu :call mmtemplates#core#InsertTemplate(g:BASH_Templates,"Statements.function")
vnoremap <buffer> <silent> \sw :call mmtemplates#core#InsertTemplate(g:BASH_Templates,"Statements.while","v")
nnoremap <buffer> <silent> \sw :call mmtemplates#core#InsertTemplate(g:BASH_Templates,"Statements.while")
vnoremap <buffer> <silent> \su :call mmtemplates#core#InsertTemplate(g:BASH_Templates,"Statements.until","v")
nnoremap <buffer> <silent> \su :call mmtemplates#core#InsertTemplate(g:BASH_Templates,"Statements.until")
vnoremap <buffer> <silent> \ss :call mmtemplates#core#InsertTemplate(g:BASH_Templates,"Statements.select","v")
nnoremap <buffer> <silent> \ss :call mmtemplates#core#InsertTemplate(g:BASH_Templates,"Statements.select")
vnoremap <buffer> <silent> \sie :call mmtemplates#core#InsertTemplate(g:BASH_Templates,"Statements.if-else","v")
nnoremap <buffer> <silent> \sie :call mmtemplates#core#InsertTemplate(g:BASH_Templates,"Statements.if-else")
vnoremap <buffer> <silent> \si :call mmtemplates#core#InsertTemplate(g:BASH_Templates,"Statements.if","v")
nnoremap <buffer> <silent> \si :call mmtemplates#core#InsertTemplate(g:BASH_Templates,"Statements.if")
vnoremap <buffer> <silent> \sfo :call mmtemplates#core#InsertTemplate(g:BASH_Templates,"Statements.for","v")
nnoremap <buffer> <silent> \sfo :call mmtemplates#core#InsertTemplate(g:BASH_Templates,"Statements.for")
vnoremap <buffer> <silent> \sf :call mmtemplates#core#InsertTemplate(g:BASH_Templates,"Statements.for-in","v")
nnoremap <buffer> <silent> \sf :call mmtemplates#core#InsertTemplate(g:BASH_Templates,"Statements.for-in")
vnoremap <buffer> <silent> \sei :call mmtemplates#core#InsertTemplate(g:BASH_Templates,"Statements.elif")
nnoremap <buffer> <silent> \sei :call mmtemplates#core#InsertTemplate(g:BASH_Templates,"Statements.elif")
vnoremap <buffer> <silent> \sc :call mmtemplates#core#InsertTemplate(g:BASH_Templates,"Statements.case")
nnoremap <buffer> <silent> \sc :call mmtemplates#core#InsertTemplate(g:BASH_Templates,"Statements.case")
vnoremap <buffer> <silent> \cma :call mmtemplates#core#InsertTemplate(g:BASH_Templates,"Comments.macros")
nnoremap <buffer> <silent> \cma :call mmtemplates#core#InsertTemplate(g:BASH_Templates,"Comments.macros")
vnoremap <buffer> <silent> \ckc :call mmtemplates#core#InsertTemplate(g:BASH_Templates,"Comments.keyword comments")
nnoremap <buffer> <silent> \ckc :call mmtemplates#core#InsertTemplate(g:BASH_Templates,"Comments.keyword comments")
vnoremap <buffer> <silent> \css :call mmtemplates#core#InsertTemplate(g:BASH_Templates,"Comments.script sections")
nnoremap <buffer> <silent> \css :call mmtemplates#core#InsertTemplate(g:BASH_Templates,"Comments.script sections")
vnoremap <buffer> <silent> \ct :call mmtemplates#core#InsertTemplate(g:BASH_Templates,"Comments.date+time")
nnoremap <buffer> <silent> \ct :call mmtemplates#core#InsertTemplate(g:BASH_Templates,"Comments.date+time")
vnoremap <buffer> <silent> \cd :call mmtemplates#core#InsertTemplate(g:BASH_Templates,"Comments.date")
nnoremap <buffer> <silent> \cd :call mmtemplates#core#InsertTemplate(g:BASH_Templates,"Comments.date")
vnoremap <buffer> <silent> \csh :call mmtemplates#core#InsertTemplate(g:BASH_Templates,"Comments.shebang")
nnoremap <buffer> <silent> \csh :call mmtemplates#core#InsertTemplate(g:BASH_Templates,"Comments.shebang")
vnoremap <buffer> <silent> \ch :call mmtemplates#core#InsertTemplate(g:BASH_Templates,"Comments.file header")
nnoremap <buffer> <silent> \ch :call mmtemplates#core#InsertTemplate(g:BASH_Templates,"Comments.file header")
vnoremap <buffer> <silent> \cfu :call mmtemplates#core#InsertTemplate(g:BASH_Templates,"Comments.function")
nnoremap <buffer> <silent> \cfu :call mmtemplates#core#InsertTemplate(g:BASH_Templates,"Comments.function")
vnoremap <buffer> <silent> \cfr :call mmtemplates#core#InsertTemplate(g:BASH_Templates,"Comments.frame")
nnoremap <buffer> <silent> \cfr :call mmtemplates#core#InsertTemplate(g:BASH_Templates,"Comments.frame")
nnoremap <buffer> <silent> \rs :call Bash_Settings(0)
vnoremap <buffer> \rse :BashExecutable 
nnoremap <buffer> \rse :BashExecutable 
vnoremap <buffer> \rd :BashDirectRun 
nnoremap <buffer> \rd :BashDirectRun 
vnoremap <buffer> \ro :BashOutputMethod 
nnoremap <buffer> \ro :BashOutputMethod 
let s:cpo_save=&cpo
set cpo&vim
vmap <buffer> \rco <Plug>BashSupportSetBashSyntaxOpts
nmap <buffer> \rco <Plug>BashSupportSetBashSyntaxOpts
map <buffer> \rba <Plug>BashSupportSetBashInterpArgs
map <buffer> \ra <Plug>BashSupportSetBashScriptArgs
inoremap <buffer> <silent>  u:call mmtemplates#core#DeleteOptTag('\[-\w*-]\|\[+\w*+]',',',"i")gi
inoremap <buffer> <silent> \nts :call mmtemplates#core#ChooseStyle(g:BASH_Templates,"!pick")
inoremap <buffer> <silent> \ntw :call mmtemplates#wizard#SetupWizard(g:BASH_Templates)
inoremap <buffer> <silent> \ntr :call mmtemplates#core#ReadTemplates(g:BASH_Templates,"reload","all")
inoremap <buffer> <silent> \ntc :call mmtemplates#core#EditTemplateFiles(g:BASH_Templates,2)
inoremap <buffer> <silent> \ntp :call mmtemplates#core#EditTemplateFiles(g:BASH_Templates,1)
inoremap <buffer> <silent> \ntl :call mmtemplates#core#EditTemplateFiles(g:BASH_Templates,0)
inoremap <buffer> <silent> \he u:call mmtemplates#core#InsertTemplate(g:BASH_Templates,"Help.English","i")
inoremap <buffer> <silent> \pbr u:call mmtemplates#core#InsertTemplate(g:BASH_Templates,"PatternMatching.BASH_REMATCH","i")
inoremap <buffer> <silent> \ppc u:call mmtemplates#core#InsertTemplate(g:BASH_Templates,"PatternMatching.POSIX classes","i")
inoremap <buffer> <silent> \pae u:call mmtemplates#core#InsertTemplate(g:BASH_Templates,"PatternMatching.anything except","i")
inoremap <buffer> <silent> \peo u:call mmtemplates#core#InsertTemplate(g:BASH_Templates,"PatternMatching.exactly one","i")
inoremap <buffer> <silent> \pom u:call mmtemplates#core#InsertTemplate(g:BASH_Templates,"PatternMatching.one or more","i")
inoremap <buffer> <silent> \pzm u:call mmtemplates#core#InsertTemplate(g:BASH_Templates,"PatternMatching.zero or more","i")
inoremap <buffer> <silent> \pzo u:call mmtemplates#core#InsertTemplate(g:BASH_Templates,"PatternMatching.zero or one","i")
inoremap <buffer> <silent> \ioh u:call mmtemplates#core#InsertTemplate(g:BASH_Templates,"IO-Redir.here-document","i")
inoremap <buffer> <silent> \ior u:call mmtemplates#core#InsertTemplate(g:BASH_Templates,"IO-Redir.redir","i")
inoremap <buffer> <silent> \bso u:call mmtemplates#core#InsertTemplate(g:BASH_Templates,"Shopts","i")
inoremap <buffer> <silent> \bse u:call mmtemplates#core#InsertTemplate(g:BASH_Templates,"Set","i")
inoremap <buffer> <silent> \bbu u:call mmtemplates#core#InsertTemplate(g:BASH_Templates,"Builtins","i")
inoremap <buffer> <silent> \ben u:call mmtemplates#core#InsertTemplate(g:BASH_Templates,"Environment","i")
inoremap <buffer> <silent> \bsp u:call mmtemplates#core#InsertTemplate(g:BASH_Templates,"SpecParams","i")
inoremap <buffer> <silent> \bps u:call mmtemplates#core#InsertTemplate(g:BASH_Templates,"ParamSub","i")
inoremap <buffer> <silent> \tm u:call mmtemplates#core#InsertTemplate(g:BASH_Templates,"Tests.string matches regexp","i")
inoremap <buffer> <silent> \tfd u:call mmtemplates#core#InsertTemplate(g:BASH_Templates,"Tests.file descriptor is open, refers to a terminal, -t","i")
inoremap <buffer> <silent> \tvs u:call mmtemplates#core#InsertTemplate(g:BASH_Templates,"Tests.variable has been set, -v","i")
inoremap <buffer> <silent> \toe u:call mmtemplates#core#InsertTemplate(g:BASH_Templates,"Tests.option is enabled, -o","i")
inoremap <buffer> <silent> \ts u:call mmtemplates#core#InsertTemplate(g:BASH_Templates,"Tests.string comparison","i")
inoremap <buffer> <silent> \tfc u:call mmtemplates#core#InsertTemplate(g:BASH_Templates,"Tests.file characteristics","i")
inoremap <buffer> <silent> \tft u:call mmtemplates#core#InsertTemplate(g:BASH_Templates,"Tests.file types","i")
inoremap <buffer> <silent> \tfp u:call mmtemplates#core#InsertTemplate(g:BASH_Templates,"Tests.file permissions","i")
inoremap <buffer> <silent> \ta u:call mmtemplates#core#InsertTemplate(g:BASH_Templates,"Tests.arithmetic tests","i")
inoremap <buffer> <silent> \sai u:call mmtemplates#core#InsertTemplate(g:BASH_Templates,"Statements.array indices","i")
inoremap <buffer> <silent> \san u:call mmtemplates#core#InsertTemplate(g:BASH_Templates,"Statements.no of element","i")
inoremap <buffer> <silent> \ssa u:call mmtemplates#core#InsertTemplate(g:BASH_Templates,"Statements.subarray","i")
inoremap <buffer> <silent> \sas u:call mmtemplates#core#InsertTemplate(g:BASH_Templates,"Statements.array elements, string","i")
inoremap <buffer> <silent> \saa u:call mmtemplates#core#InsertTemplate(g:BASH_Templates,"Statements.array elements, all","i")
inoremap <buffer> <silent> \sae u:call mmtemplates#core#InsertTemplate(g:BASH_Templates,"Statements.array element","i")
inoremap <buffer> <silent> \sp u:call mmtemplates#core#InsertTemplate(g:BASH_Templates,"Statements.printf","i")
inoremap <buffer> <silent> \se u:call mmtemplates#core#InsertTemplate(g:BASH_Templates,"Statements.echo","i")
inoremap <buffer> <silent> \sfu u:call mmtemplates#core#InsertTemplate(g:BASH_Templates,"Statements.function","i")
inoremap <buffer> <silent> \sw u:call mmtemplates#core#InsertTemplate(g:BASH_Templates,"Statements.while","i")
inoremap <buffer> <silent> \su u:call mmtemplates#core#InsertTemplate(g:BASH_Templates,"Statements.until","i")
inoremap <buffer> <silent> \ss u:call mmtemplates#core#InsertTemplate(g:BASH_Templates,"Statements.select","i")
inoremap <buffer> <silent> \sie u:call mmtemplates#core#InsertTemplate(g:BASH_Templates,"Statements.if-else","i")
inoremap <buffer> <silent> \si u:call mmtemplates#core#InsertTemplate(g:BASH_Templates,"Statements.if","i")
inoremap <buffer> <silent> \sfo u:call mmtemplates#core#InsertTemplate(g:BASH_Templates,"Statements.for","i")
inoremap <buffer> <silent> \sf u:call mmtemplates#core#InsertTemplate(g:BASH_Templates,"Statements.for-in","i")
inoremap <buffer> <silent> \sei u:call mmtemplates#core#InsertTemplate(g:BASH_Templates,"Statements.elif","i")
inoremap <buffer> <silent> \sc u:call mmtemplates#core#InsertTemplate(g:BASH_Templates,"Statements.case","i")
inoremap <buffer> <silent> \cma u:call mmtemplates#core#InsertTemplate(g:BASH_Templates,"Comments.macros","i")
inoremap <buffer> <silent> \ckc u:call mmtemplates#core#InsertTemplate(g:BASH_Templates,"Comments.keyword comments","i")
inoremap <buffer> <silent> \css u:call mmtemplates#core#InsertTemplate(g:BASH_Templates,"Comments.script sections","i")
inoremap <buffer> <silent> \ct u:call mmtemplates#core#InsertTemplate(g:BASH_Templates,"Comments.date+time","i")
inoremap <buffer> <silent> \cd u:call mmtemplates#core#InsertTemplate(g:BASH_Templates,"Comments.date","i")
inoremap <buffer> <silent> \csh u:call mmtemplates#core#InsertTemplate(g:BASH_Templates,"Comments.shebang","i")
inoremap <buffer> <silent> \ch u:call mmtemplates#core#InsertTemplate(g:BASH_Templates,"Comments.file header","i")
inoremap <buffer> <silent> \cfu u:call mmtemplates#core#InsertTemplate(g:BASH_Templates,"Comments.function","i")
inoremap <buffer> <silent> \cfr u:call mmtemplates#core#InsertTemplate(g:BASH_Templates,"Comments.frame","i")
inoremap <buffer> \rse :BashExecutable 
inoremap <buffer> \rd :BashDirectRun 
inoremap <buffer> \ro :BashOutputMethod 
imap <buffer> \rco <Plug>BashSupportSetBashSyntaxOpts
imap <buffer> \rba <Plug>BashSupportSetBashInterpArgs
imap <buffer> \ra <Plug>BashSupportSetBashScriptArgs
inoremap <buffer> <silent> \eyw :call BASH_EchoWithColorUnderlineWord("yellow")
inoremap <buffer> <silent> \egw :call BASH_EchoWithColorUnderlineWord("green")
inoremap <buffer> <silent> \erw :call BASH_EchoWithColorUnderlineWord("red")
inoremap <buffer> <silent> \eyu :call BASH_EchoWithColorAndUnderline("yellow")
inoremap <buffer> <silent> \egu :call BASH_EchoWithColorAndUnderline("green")
inoremap <buffer> <silent> \eru :call BASH_EchoWithColorAndUnderline("red")
inoremap <buffer> <silent> \ey :call BASH_EchoWithColor("yellow")
inoremap <buffer> <silent> \eg :call BASH_EchoWithColor("green")
inoremap <buffer> <silent> \er :call BASH_EchoWithColor("red")
inoremap <buffer> <silent> \rp :call BASH_Readprompt()
let &cpo=s:cpo_save
unlet s:cpo_save
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
setlocal cinkeys=0{,0},0),:,0#,!^F,o,O,e
setlocal cinoptions=
setlocal cinwords=if,else,while,do,for,switch
setlocal colorcolumn=
setlocal comments=s1:/*,mb:*,ex:*/,://,b:#,:%,:XCOMM,n:>,fb:-
setlocal commentstring=#%s
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
setlocal dictionary=~/.mydotfiles/plugins/vim/.vim/bundle/bash-support/bash-support/wordlists/bash-keywords.list
setlocal nodiff
setlocal equalprg=
setlocal errorformat=
setlocal noexpandtab
if &filetype != 'sh'
setlocal filetype=sh
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
setlocal formatoptions=tcq
setlocal formatlistpat=^\\s*\\d\\+[\\]:.)}\\t\ ]\\s*
setlocal formatprg=
setlocal grepprg=
setlocal iminsert=0
setlocal imsearch=-1
setlocal include=
setlocal includeexpr=
setlocal indentexpr=GetShIndent()
setlocal indentkeys=0{,0},!^F,o,O,e,0=then,0=do,0=else,0=elif,0=fi,0=esac,0=done,0=end,),0=;;,0=;&,0=fin,0=fil,0=fip,0=fir,0=fix
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
setlocal shiftwidth=8
setlocal noshortname
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
if &syntax != 'sh'
setlocal syntax=sh
endif
setlocal tabstop=8
setlocal tagcase=
setlocal tags=
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
let s:l = 38 - ((33 * winheight(0) + 35) / 70)
if s:l < 1 | let s:l = 1 | endif
exe s:l
normal! zt
38
normal! 02|
lcd ~/.mydotfiles/plugins/vim/.vim/bundle
tabnext 1
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
