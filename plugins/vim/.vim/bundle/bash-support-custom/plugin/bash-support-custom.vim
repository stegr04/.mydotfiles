"#########################################################################################
"
"       Filename:  bash-support.vim
"
"    Description:  BASH support     (VIM Version 7.0+)
"
"                  Write BASH-scripts by inserting comments, statements, tests,
"                  variables and builtins.
"
"  Configuration:  There are some personal details which should be configured
"                    (see the files README.bashsupport and bashsupport.txt).
"
"   Dependencies:  The environmnent variables $HOME und $SHELL are used.
"
"   GVIM Version:  7.0+
"
"         Author:  Dr.-Ing. Fritz Mehner, FH Südwestfalen, 58644 Iserlohn, Germany
"          Email:  mehner@fh-swf.de
"
"        Version:  see variable  g:BASH_Version  below
"        Created:  26.02.2001
"        License:  Copyright (c) 2001-2008, Fritz Mehner
"                  This program is free software; you can redistribute it and/or
"                  modify it under the terms of the GNU General Public License as
"                  published by the Free Software Foundation, version 2 of the
"                  License.
"                  This program is distributed in the hope that it will be
"                  useful, but WITHOUT ANY WARRANTY; without even the implied
"                  warranty of MERCHANTABILITY or FITNESS FOR A PARTICULAR
"                  PURPOSE.
"                  See the GNU General Public License version 2 for more details.
"       Revision:  $Id: bash-support.vim,v 1.36 2009/01/29 20:46:43 mehner Exp $
"
"------------------------------------------------------------------------------
"

"------------------------------------------------------------------------------
"  BASH_Readprompt    {{{1
"------------------------------------------------------------------------------
function! BASH_Readprompt ()
        call inputsave()
        let readcmdvar = input('Variable name: ')
        let readcmdvar = toupper(readcmdvar)
        call inputrestore()
        call inputsave()
        let readcmdprompt = input('Prompt Text: ')
        call inputrestore()
        let readcmdpromptFirst = toupper(matchstr(readcmdprompt,'.'))
        let readcmdprompt = substitute( readcmdprompt,'.',readcmdpromptFirst,'&')
	let readcmd = 'read -a ' . readcmdvar . ' -p $''\e[1;33m\e[100m' . readcmdprompt . ':\e[0m '''
        call setline('.', readcmd)
	
endfunction    " ----------  end of function BASH_RemoveGuiMenus  ----------
"------------------------------------------------------------------------------
"  BASH_EchoWithColor    {{{1
"------------------------------------------------------------------------------
function! BASH_EchoWithColor (colorarg)
        call inputsave()
        let texttoecho = input('Echo text: ')
        call inputrestore()

	if a:colorarg ==# "red"
            let echocmd = 'echo -e "\e[1;31m' . texttoecho . '\e[0m"'
        elseif a:colorarg ==# "green"
            let echocmd = 'echo -e "\e[1;32m' . texttoecho . '\e[0m"'
        elseif a:colorarg ==# "yellow"
            let echocmd = 'echo -e "\e[1;33m' . texttoecho . '\e[0m"'
        endif
        call setline('.', echocmd)
	
endfunction    " ----------  end of function BASH_RemoveGuiMenus  ----------
"------------------------------------------------------------------------------
"  BASH_EchoWithColorAndUnderline    {{{1
"------------------------------------------------------------------------------
function! BASH_EchoWithColorAndUnderline (colorarg)
        call inputsave()
        let texttoecho = input('Echo text: ')
        call inputrestore()

	if a:colorarg ==# "red"
            let echocmd = 'echo -e "\e[1;31m\e[4;31m' . texttoecho . '\e[0m"'
        elseif a:colorarg ==# "green"
            let echocmd = 'echo -e "\e[4;32m' . texttoecho . '\e[0m"'
        elseif a:colorarg ==# "yellow"
            let echocmd = 'echo -e "\e[1;33m\e[4;33m' . texttoecho . '\e[0m"'
        endif
        call setline('.', echocmd)
	
endfunction    " ----------  end of function BASH_RemoveGuiMenus  ----------
"------------------------------------------------------------------------------
"  BASH_EchoWithColorUnderlineWord    {{{1
"------------------------------------------------------------------------------
function! BASH_EchoWithColorUnderlineWord (colorarg)
        call inputsave()
        let texttoecho = input('Echo text: ')
        call inputrestore()
        
        call inputsave()
        let texttounderline = input('Text to underline: ')
        call inputrestore()
        
        "let texttounderlineLen = strlen(texttounderline)
        "let texttounderlineposbegin = match(texttoecho, texttounderline)
        "let texttounderlineposend = match(texttoecho, texttounderline)
        "let textoecho1 = matchstr(texttoecho, '.*', 0, texttounderlineposbegin)
        "let texttoecho2 = matchstr(texttoecho, '.*', texttounderlineposend)

        "let newtexttoecho = substitute( readcmdprompt,'.',readcmdpromptFirst,'&')
        
	if a:colorarg ==# "red"
            let echocmd = 'echo -e "\e[1;31m' . texttoecho . '\e[0m"'
            let echocmd = substitute(echocmd, texttounderline, '\\e[1;31m\\e[4;31m'.texttounderline.'\\e[0m\\e[1;31m', 'g')
        elseif a:colorarg ==# "green"
            let echocmd = 'echo -e "\e[1;32m' . texttoecho . '\e[0m"'
            let echocmd = substitute(echocmd, texttounderline, '\\e[4;32m'.texttounderline.'\\e[0m\\e[1;32m', 'g')
        elseif a:colorarg ==# "yellow"
            let echocmd = 'echo -e "\e[1;33m' . texttoecho . '\e[0m"'
            let echocmd = substitute(echocmd, texttounderline, '\\e[1;33m\\e[4;33m'.texttounderline.'\\e[0m\\e[1;33m', 'g')
        endif
        call setline('.', echocmd)
	
endfunction    " ----------  end of function BASH_RemoveGuiMenus  ----------
