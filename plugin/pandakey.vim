" --------------------------------
" Add our plugin to the path
" --------------------------------
python3 import sys
python3 import vim
python3 sys.path.append(vim.eval('expand("<sfile>:h")'))

" example usage of python
function! TemplateExample()
python3 << endOfPython

from pandakey import pandakey_example

for n in range(5):
    print(pandakey_example())

endOfPython
endfunction

"  Expose our commands to the user
command! Example call TemplateExample()

" example of returning values from python to vim
function! TestPy2()
python3 << EOF
import vim
s = range(10)
vim.command("let sInVim = %s"% s)
EOF
    echo type(sInVim)
    echo sInVim
endfunction

" example of a autocomplete function
function! TestComplete(findstart, base)
    if a:findstart
        " locate the start of the word
        let line = getline('.')
        let start = col('.') - 1
        while start > 0 && (line[start - 1] =~ '\a' || line[start - 1] =~ '.' || line[start - 1] =~ '-')
            let start -= 1
        endwhile
        return start
    else
        return ["this works!", "nice!"]
    endif
endfun

" shortcut Ctrl-X Ctrl-U
set completefunc=TestComplete

" example of a autocomplete function in python
function! TestCompletePy(findstart, base)
python3 << EOF
import vim

# printing arguments
print(vim.eval('a:findstart'))
print(vim.eval('a:base'))

s = "I"
vim.command("let sInVim = '%s'"% s)
EOF
echo sInVim
return sInVim
endfunction

function! TestComplete2(findstart, base)
    if a:findstart
        echo "this worked"
        " locate the start of the word
        let line = getline('.')
        let start = col('.') - 1
        while start > 0 && (line[start - 1] =~ '\a' || line[start - 1] =~ '.' || line[start - 1] =~ '-')
            let start -= 1
        endwhile
        return start
    else
        let sInVim = TestCompletePy(a:findstart, a:base)
        return [sInVim, "and this"]
    endif
endfun
set completefunc=TestComplete2


