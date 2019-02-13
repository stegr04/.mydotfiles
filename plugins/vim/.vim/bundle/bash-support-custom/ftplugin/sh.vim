 
" noremap  <buffer>  <silent>  <LocalLeader>er      ^iecho<Space>-e<Space>"\e[1;32mREPLACEMENTTEXT.\e[0m"<Esc>?REPLACEMENTTEXT<cr>gnc
" inoremap  <buffer>  <silent>  <LocalLeader>er        echo<Space>-e<Space>"\e[1;32mREPLACEMENTTEXT.\e[0m"<Esc>?REPLACEMENTTEXT<cr>gnc
" vnoremap  <buffer>  <silent>  <LocalLeader>er       secho<Space>-e<Space>"\e[1;32mREPLACEMENTTEXT.\e[0m"<Esc>?REPLACEMENTTEXT<cr>gnc

 noremap  <buffer>  <silent>  <LocalLeader>rp           :call BASH_Readprompt()<CR><CR>
inoremap  <buffer>  <silent>  <LocalLeader>rp      <Esc>:call BASH_Readprompt()<CR><CR>
vnoremap  <buffer>  <silent>  <LocalLeader>rp      <Esc>:call BASH_Readprompt()<CR><CR>

 noremap  <buffer>  <silent>  <LocalLeader>er           :call BASH_EchoWithColor("red")<CR><CR>
inoremap  <buffer>  <silent>  <LocalLeader>er      <Esc>:call BASH_EchoWithColor("red")<CR><CR>
vnoremap  <buffer>  <silent>  <LocalLeader>er      <Esc>:call BASH_EchoWithColor("red")<CR><CR>

 noremap  <buffer>  <silent>  <LocalLeader>eg           :call BASH_EchoWithColor("green")<CR><CR>
inoremap  <buffer>  <silent>  <LocalLeader>eg      <Esc>:call BASH_EchoWithColor("green")<CR><CR>
vnoremap  <buffer>  <silent>  <LocalLeader>eg      <Esc>:call BASH_EchoWithColor("green")<CR><CR>

 noremap  <buffer>  <silent>  <LocalLeader>ey           :call BASH_EchoWithColor("yellow")<CR><CR>
inoremap  <buffer>  <silent>  <LocalLeader>ey      <Esc>:call BASH_EchoWithColor("yellow")<CR><CR>
vnoremap  <buffer>  <silent>  <LocalLeader>ey      <Esc>:call BASH_EchoWithColor("yellow")<CR><CR>

 noremap  <buffer>  <silent>  <LocalLeader>eru           :call BASH_EchoWithColorAndUnderline("red")<CR><CR>
inoremap  <buffer>  <silent>  <LocalLeader>eru      <Esc>:call BASH_EchoWithColorAndUnderline("red")<CR><CR>
vnoremap  <buffer>  <silent>  <LocalLeader>eru      <Esc>:call BASH_EchoWithColorAndUnderline("red")<CR><CR>

 noremap  <buffer>  <silent>  <LocalLeader>egu           :call BASH_EchoWithColorAndUnderline("green")<CR><CR>
inoremap  <buffer>  <silent>  <LocalLeader>egu      <Esc>:call BASH_EchoWithColorAndUnderline("green")<CR><CR>
vnoremap  <buffer>  <silent>  <LocalLeader>egu      <Esc>:call BASH_EchoWithColorAndUnderline("green")<CR><CR>

 noremap  <buffer>  <silent>  <LocalLeader>eyu           :call BASH_EchoWithColorAndUnderline("yellow")<CR><CR>
inoremap  <buffer>  <silent>  <LocalLeader>eyu      <Esc>:call BASH_EchoWithColorAndUnderline("yellow")<CR><CR>
vnoremap  <buffer>  <silent>  <LocalLeader>eyu      <Esc>:call BASH_EchoWithColorAndUnderline("yellow")<CR><CR>

 noremap  <buffer>  <silent>  <LocalLeader>erw           :call BASH_EchoWithColorUnderlineWord("red")<CR><CR>
inoremap  <buffer>  <silent>  <LocalLeader>erw      <Esc>:call BASH_EchoWithColorUnderlineWord("red")<CR><CR>
vnoremap  <buffer>  <silent>  <LocalLeader>erw      <Esc>:call BASH_EchoWithColorUnderlineWord("red")<CR><CR>

 noremap  <buffer>  <silent>  <LocalLeader>egw           :call BASH_EchoWithColorUnderlineWord("green")<CR><CR>
inoremap  <buffer>  <silent>  <LocalLeader>egw      <Esc>:call BASH_EchoWithColorUnderlineWord("green")<CR><CR>
vnoremap  <buffer>  <silent>  <LocalLeader>egw      <Esc>:call BASH_EchoWithColorUnderlineWord("green")<CR><CR>

 noremap  <buffer>  <silent>  <LocalLeader>eyw           :call BASH_EchoWithColorUnderlineWord("yellow")<CR><CR>
inoremap  <buffer>  <silent>  <LocalLeader>eyw      <Esc>:call BASH_EchoWithColorUnderlineWord("yellow")<CR><CR>
vnoremap  <buffer>  <silent>  <LocalLeader>eyw      <Esc>:call BASH_EchoWithColorUnderlineWord("yellow")<CR><CR>
