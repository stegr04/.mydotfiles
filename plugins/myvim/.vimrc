"===============================================================================
"
"          File:  customization.vimrc
" 
"   Description:  .vimrc settings to control some bare minimum settings.
" 			I believe I started too heavy in this file without
" 			utilizing a bunch of stuff. This led to the feeling of 
" 			things not behaving the way they should. A lot has
" 			been commented out. Remove if it doesn't make sense in
" 			12 months. Look for alternative features in different
" 			plugins. If things start behaving differently then
" 			look at recently added plugins. 
" 
"   VIM Version:  8.1 - See vimVersion file for --version information.
"        Author:  Gregg J Stewart, stegr04@gmail.com
"       Version:  1.0
"       Created:  2019-01-17 23:02
"      Revision:  ---
"===============================================================================

"
"===============================================================================
" GENERAL SETTINGS
"===============================================================================

" GJS: BEGIN VUNDLE SETUP
"-------------------------------------------------------------------------------
" set nocompatible == Use Vim settings, rather then Vi settings.
" This must be first, because it changes other options as a side effect.
"-------------------------------------------------------------------------------
set nocompatible              " be iMproved, required
filetype off                  " required

" set the runtime path to include Vundle and initialize
set rtp+=~/.vim/bundle/Vundle.vim
call vundle#begin()
" alternatively, pass a path where Vundle should install plugins
"call vundle#begin('~/some/path/here')

" let Vundle manage Vundle, required
Plugin 'VundleVim/Vundle.vim'

" The following are examples of different formats supported.
" Keep Plugin commands between vundle#begin/end.
" plugin on GitHub repo
Plugin 'tpope/vim-fugitive'
" plugin from http://vim-scripts.org/vim/scripts.html
" Plugin 'L9'
" Git plugin not hosted on GitHub
" Plugin 'git://git.wincent.com/command-t.git'
" git repos on your local machine (i.e. when working on your own plugin)
" Plugin 'file:///home/gmarik/path/to/plugin'
" The sparkup vim script is in a subdirectory of this repo called vim.
" Pass the path to set the runtimepath properly.
" Plugin 'rstacruz/sparkup', {'rtp': 'vim/'}
" Install L9 and avoid a Naming conflict if you've already installed a
" different version somewhere else.
" Plugin 'ascenator/L9', {'name': 'newL9'}

" GJS: Tree explorer plugin for vim & user preferences plugin
Plugin 'scrooloose/nerdtree'
Plugin 'stegr04/nerdtree-custom'

" GJS: Cool auto insert of strutures + custom auto insert preferences
Plugin 'https://github.com/WolfgangMehner/bash-support'
Plugin 'stegr04/bash-support-custom'

" GJS: A quoting/parenthesizing made vimple plugin
Plugin 'tpope/vim-surround'

" GJS: Include URL for ctrlp
Plugin 'ctrlpvim/ctrlp.vim'

" GJS: Include vim-airline and vim-airline-themes
Plugin 'vim-airline/vim-airline'
Plugin 'vim-airline/vim-airline-themes'

" GJS: Include solarized theme/plugin & user prefernces plugin
Plugin 'altercation/vim-colors-solarized'
Plugin 'stegr04/vim-colors-solarized-custom'

" GJS: vim-bufferline for including buffer numbers/names in status bar.
Plugin 'bling/vim-bufferline'

" GJS: supertab for autocomplete
Plugin 'ervandew/supertab'

" GJS: used for editing ansible files
Plugin 'pearofducks/ansible-vim'

" GJS: used for loading fzf.vim
Plugin 'vim-plug'
Plugin 'junegunn/fzf.vim'

" GJS: used for diffing directories (like vimdiff)
Plugin 'will133/vim-dirdiff'

" GJS: incremental search improved
Plugin 'haya14busa/is.vim'
"Plugin 'haya14busa/incsearch.vim'

" GJS: Modify * to also work with visual selections
Plugin 'nelstrom/vim-visual-star-search'

" All of your Plugins must be added before the following line
call vundle#end()            " required
filetype plugin indent on    " required
" To ignore plugin indent changes, instead use:
"filetype plugin on
" GJS: END VUNDLE SETUP


" GJS: Adding vim-plug and fzf

if empty(glob('~/.vim/autoload/plug.vim'))
  silent !curl -fLo ~/.vim/autoload/plug.vim --create-dirs
    \ https://raw.githubusercontent.com/junegunn/vim-plug/master/plug.vim
  autocmd VimEnter * PlugInstall --sync | source $MYVIMRC
endif

call plug#begin('~/.vim/bundle')
Plug 'junegunn/fzf', { 'dir': '~/.fzf', 'do': './install --all' }
Plug '~/.fzf'
"Plug 'junegunn/fzf.vim'
call plug#end()

" GJS: Testing airline settings
"let g:airline#extensions#tabline#enabled = 1
"let g:airline#extensions#tabline#formatter = 'unique_tail_improved'

" GJS: BEGIN My Preferences

" Set Leaders
let mapleader = ","
let maplocalleader = "\\"

"GJS IncSearch
"map / <Plug>(is-forward)
"map ? <Plug>(is-backward)
"map g/ <Plug>(is-stay)
"let g:is#do_default_mappings = 0
set is
" Press * to search for the term under the cursor or a visual selection and 
" then press a key below to replace all instances of it in the current file.
nnoremap <Leader>r :%s///g<Left><Left>
nnoremap <Leader>rc :%s///gc<Left><Left><Left>

" The same as above but instead of acting on the whole file it will be 
" restricted to the previously visually selected range. You can do that by 
" pressing *, visually selecting the range you want it to apply to and then 
" press a key below to replace all instances of it in the current selection. 
xnoremap <Leader>r :s///g<Left><Left>
xnoremap <Leader>rc :s///gc<Left><Left><Left>
"augroup vimrc-incsearch-highlight
		  "autocmd!
		  "autocmd CmdlineEnter /,\? :set hlsearch
		  "autocmd CmdlineLeave /,\? :set nohlsearch
		"augroup END


" Some tips from: http://learnvimscriptthehardway.stevelosh.com/chapters/07.html
" Set quick edit and sourcing of .vimrc and sessions
"nnoremap <leader>ev :source ~/.mydotfiles/myvim-files.vim<cr>
nnoremap <leader>ev :vsplit $MYVIMRC<cr>
nnoremap <leader>sv :source $MYVIMRC<cr>
nnoremap <leader>ez :source ~/.mydotfiles/myzsh-files.vim
nnoremap <leader>eb :source ~/.mydotfiles/mybin-files.vim
nnoremap <leader>ec :source ~/.mydotfiles/mycase-files.vim

nnoremap ;; :ls<cr>

" set line numbers
set nu

" Set wildchar, wildmenu and wildcharm to scroll through buffers and more in a
" menu of choices - instead of cycling through 1x1. Then shortcut F10 to jump
" into buffer hopping. 
set wildchar=<Tab> wildmenu wildmode=full
set wildcharm=<C-Z>
nnoremap <F10> :b <C-Z>


" Set to show the buffer number in the status line
set laststatus=2 statusline=%02n:%<%f\ %h%m%r=%-14.(%l,%c%V%)\ %P

" CTRL-Tab is next tab
noremap <C-Tab> :<C-U>tabnext<CR>
inoremap <C-Tab> <C-\><C-N>:tabnext<CR>
cnoremap <C-Tab> <C-C>:tabnext<CR>
" CTRL-SHIFT-Tab is previous tab
noremap <C-S-Tab> :<C-U>tabprevious<CR>
inoremap <C-S-Tab> <C-\><C-N>:tabprevious<CR>
cnoremap <C-S-Tab> <C-C>:tabprevious<CR>

" END GJS: END My Preferences 

"set clipboard=unnamedplus
" This setting allowsme to use my mouse to place the cursor, select text in
" visual move
" set mouse=a

"set wrap

" Change the default directory
"cd ~/tmp

"set tabstop=8 softtabstop=2 expandtab shiftwidth=2 smarttab
"noremap <Leader>- ddp
"noremap <Leader>- ddP

" I like this mapping. It converts the selected word and changes it to upper
" case (like when you want a variable, perhaps, in all uppercase)
"nnoremap <c-u> viwU
"inoremap <c-u> <esc>viwUi


"iabbrev adn and
"iabbrev waht what
"iabbrev tehn then

"nnoremap <leader>" viw<esc>a"<esc>hbi"<esc>lel
"nnoremap <leader>' vim<esc>a'<esc>hbi'<esc>lel

"nnoremap H 0
"nnoremap L $

"vnoremap <leader>" <esc>a"<esc>`<i"<esc>`>

" These mappings make it so that j+k is used to escape out of insert mode. And
" the nop mapping is to disable esc to build muscle memory.
inoremap jk <esc>
inoremap <esc> <nop>


"-------------------------------------------------------------------------------
" Enable file type detection. Use the default filetype settings.
" Also load indent files, to automatically do language-dependent indenting.
"-------------------------------------------------------------------------------
"filetype  plugin on
"filetype  indent on
"
"-------------------------------------------------------------------------------
" Switch syntax highlighting on.
"-------------------------------------------------------------------------------
"syntax    on            
"
" Platform specific items:
" - central backup directory (has to be created)
" - default dictionary
" Uncomment your choice.  
"if  has("win16") || has("win32")     || has("win64") || 
"  \ has("win95") || has("win32unix")
    "
"    runtime mswin.vim
"    set backupdir =$VIM\vimfiles\backupdir
"    set dictionary=$VIM\vimfiles\wordlists/german.list
"else
"    set backupdir =$HOME/.vim.backupdir
"    set dictionary=$HOME/.vim/wordlists/german.list
"endif
"
" Using a backupdir under UNIX/Linux: you may want to include a line similar to
"   find  $HOME/.vim.backupdir -name "*" -type f -mtime +60 -exec rm -f {} \;
" in one of your shell startup files (e.g. $HOME/.profile)
"
"-------------------------------------------------------------------------------
" Various settings
"-------------------------------------------------------------------------------
"set autoindent                  " copy indent from current line
"set autoread                    " read open files again when changed outside Vim
"set autowrite                   " write a modified buffer on each :next , ...
"set backspace=indent,eol,start  " backspacing over everything in insert mode
"set backup                      " keep a backup file
"set browsedir=current           " which directory to use for the file browser
"set complete+=k                 " scan the files given with the 'dictionary' option
"set history=50                  " keep 50 lines of command line history
"set hlsearch                    " highlight the last used search pattern
"set incsearch                   " do incremental searching
"set listchars=tab:>.,eol:\$     " strings to use in 'list' mode
"set mouse=a                     " enable the use of the mouse
"set nowrap                      " do not wrap lines
"set popt=left:8pc,right:3pc     " print options
"set ruler                       " show the cursor position all the time
"set shiftwidth=2                " number of spaces to use for each step of indent
"set showcmd                     " display incomplete commands
"set smartindent                 " smart autoindenting when starting a new line
"set tabstop=2                   " number of spaces that a <Tab> counts for
"set visualbell                  " visual bell instead of beeping
"set wildignore=*.bak,*.o,*.e,*~ " wildmenu: ignore these extensions
"set wildmenu                    " command-line completion in an enhanced mode
"
"===================================================================================
" BUFFERS, WINDOWS
"===================================================================================
"
"-------------------------------------------------------------------------------
" The current directory is the directory of the file in the current window.
"-------------------------------------------------------------------------------
"if has("autocmd")
"  autocmd BufNewFile,BufRead * :lchdir %:p:h
"endif
"
"-------------------------------------------------------------------------------
" close window (conflicts with the KDE setting for calling the process manager)
"-------------------------------------------------------------------------------
" noremap  <C-Esc>       :close<CR>
"inoremap  <C-Esc>  <C-C>:close<CR>
"
"-------------------------------------------------------------------------------
" Fast switching between buffers
" The current buffer will be saved before switching to the next one.
" Choose :bprevious or :bnext
"-------------------------------------------------------------------------------
" noremap  <silent> <s-tab>       :if &modifiable && !&readonly && 
"     \                      &modified <CR> :write<CR> :endif<CR>:bprevious<CR>
"inoremap  <silent> <s-tab>  <C-C>:if &modifiable && !&readonly && 
"     \                      &modified <CR> :write<CR> :endif<CR>:bprevious<CR>
"
"-------------------------------------------------------------------------------
" Leave the editor with Ctrl-q (KDE): Write all changed buffers and exit Vim
"-------------------------------------------------------------------------------
"nnoremap  <C-q>    :wqall<CR>
"
"-------------------------------------------------------------------------------
" When editing a file, always jump to the last known cursor position.
" Don't do it when the position is invalid or when inside an event handler
" (happens when dropping a file on gvim).
"-------------------------------------------------------------------------------
"if has("autocmd")
"  autocmd BufReadPost *
"        \ if line("'\"") > 0 && line("'\"") <= line("$") |
"        \   exe "normal! g`\"" |
"        \ endif
"endif " has("autocmd")
"
"-------------------------------------------------------------------------------
"  some additional hot keys
"-------------------------------------------------------------------------------
"    F2   -  write file without confirmation
"    F3   -  call file explorer Ex
"    F4   -  show tag under curser in the preview window (tagfile must exist!)
"    F5   -  open quickfix error window
"    F6   -  close quickfix error window
"    F7   -  display previous error
"    F8   -  display next error   
"-------------------------------------------------------------------------------
"
"noremap   <silent> <F2>        :write<CR>
"noremap   <silent> <F3>        :Explore<CR>
"nnoremap  <silent> <F4>        :exe ":ptag ".expand("<cword>")<CR>
"noremap   <silent> <F5>        :copen<CR>
"noremap   <silent> <F6>        :cclose<CR>
"noremap   <silent> <F7>        :cp<CR>
"noremap   <silent> <F8>        :cn<CR>
"
"inoremap  <silent> <F2>   <Esc>:write<CR>
"inoremap  <silent> <F3>   <Esc>:Explore<CR>
"inoremap  <silent> <F4>   <Esc>:exe ":ptag ".expand("<cword>")<CR>
"inoremap  <silent> <F5>   <Esc>:copen<CR>
"inoremap  <silent> <F6>   <Esc>:cclose<CR>
"inoremap  <silent> <F7>   <Esc>:cp<CR>
"inoremap  <silent> <F8>   <Esc>:cn<CR>
"-------------------------------------------------------------------------------
" autocomplete parenthesis, brackets and braces
"-------------------------------------------------------------------------------
"inoremap ( ()<Left>
"inoremap [ []<Left>
"inoremap { {}<Left>
"
"vnoremap ( s()<Esc>P
"vnoremap [ s[]<Esc>P
"vnoremap { s{}<Esc>P
"
"-------------------------------------------------------------------------------
" autocomplete quotes
"-------------------------------------------------------------------------------
"vnoremap  '  s''<Esc>P<Right>
"vnoremap  "  s""<Esc>P<Right>
"vnoremap  `  s``<Esc>P<Right>
"
"inoremap	'  '<Esc>:call QuoteInsertionWrapper("'")<CR>a
"inoremap	"  "<Esc>:call QuoteInsertionWrapper('"')<CR>a
"inoremap	`  `<Esc>:call QuoteInsertionWrapper('`')<CR>a
"
"-------------------------------------------------------------------------------
" function QuoteInsertionWrapper			{{{3
"
" Add a second quote only if the left and the right character are not keyword
" characters and the right character is not the same quote.
"-------------------------------------------------------------------------------
"function! QuoteInsertionWrapper (quote)
"  let col   = col('.')
"  let line  = getline('.')
"  if    ( line[col-2] =~ '\k'    )
"  \  || ( line[col  ] =~ '\k'    )
"  \  || ( line[col-2] =~ a:quote )
"  \  || ( line[col  ] =~ a:quote )
"    return a:quote
"  else
"    return a:quote.a:quote."\<Left>"
"  endif
"endfunction 
"
"===============================================================================
" VARIOUS PLUGIN CONFIGURATIONS
"===============================================================================
"
"-------------------------------------------------------------------------------
" plugin bash-support.vim
"-------------------------------------------------------------------------------
" --empty --
"                         
"-------------------------------------------------------------------------------
" taglist.vim : toggle the taglist window
"-------------------------------------------------------------------------------
" noremap <silent> <F11>  <Esc><Esc>:Tlist<CR>
"inoremap <silent> <F11>  <Esc><Esc>:Tlist<CR>

"GJS TESTING: BTW.. i really like these settings to navigate windows in vim.
"find a more permanent home for them.
let g:BASH_Ctrl_j = 'off'
nnoremap <C-j> <C-w>j
nnoremap <C-k> <C-w>k
nnoremap <C-h> <C-w>h
nnoremap <C-l> <C-w>l

let g:nerd_preview_enabled = 0
let g:preview_last_buffer  = 0

function! NerdTreePreview()
  " Only on nerdtree window
  if (&ft ==# 'nerdtree')
    " Get filename
    let l:filename = substitute(getline("."), "^\\s\\+\\|\\s\\+$","","g")

    " Preview if it is not a folder
    let l:lastchar = strpart(l:filename, strlen(l:filename) - 1, 1)
    if (l:lastchar != "/" && strpart(l:filename, 0 ,2) != "..")

      let l:store_buffer_to_close = 1
      if (bufnr(l:filename) > 0)
        " Don't close if the buffer is already open
        let l:store_buffer_to_close = 0
      endif

      " Do preview
      execute "normal go"

      " Close previews buffer
      if (g:preview_last_buffer > 0)
        execute "bwipeout " . g:preview_last_buffer
        let g:preview_last_buffer = 0
      endif

      " Set last buffer to close it later
      if (l:store_buffer_to_close)
        let g:preview_last_buffer = bufnr(l:filename)
      endif
    endif
  elseif (g:preview_last_buffer > 0)
    " Close last previewed buffer
    let g:preview_last_buffer = 0
  endif
endfunction

function! NerdPreviewToggle()
  if (g:nerd_preview_enabled)
    let g:nerd_preview_enabled = 0
    augroup nerdpreview
      autocmd!
      augroup END
  else
    let g:nerd_preview_enabled = 1
    augroup nerdpreview
      autocmd!
      autocmd CursorMoved * nested call NerdTreePreview()
    augroup END
  endif
endfunction

"GJS Adding updates for fzfFiles
let g:fzf_command_prefix = 'Fzf'
nnoremap <silent> <leader>o :FzfFiles<CR>
nnoremap <silent> <leader>O :FzfFiles!<CR>
"cnoremap <silent> <C-p> :FzfHistory:<CR>
"cnoremap <silent> <C-_> <ESC>:FzfHistory/<CR>
"nnoremap <silent> <leader>b  :FzfBuffers<CR>
"nnoremap <silent> <leader>'  :FzfMarks<CR>
"nnoremap <silent> <F1> :FzfHelptags<CR>
"nnoremap <silent> <F1> <ESC>:FzfHelpTags<CR>
"noremap <silent> <leader>; :FzfCommands<CR>
"nnoremap <silent> <leader>l :FzfBLines<CR>
"inoremap <silent> <F3> <ESC>:FzfSnippets<CR>
set rtp+=/usr/local/opt/fzf
