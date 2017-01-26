" --------------------------------
" Add our plugin to the path
" --------------------------------
python3 import sys
python3 import vim
python3 sys.path.append(vim.eval('expand("<sfile>:h")'))

function! TestNGram(findstart, base)
python3 << EOF
import http.client as ht
import vim

# printing arguments
print(vim.eval('a:findstart'))
print(vim.eval('a:base'))

full_hist = vim.eval('a:base').split()
hist = full_hist[-2:]

c = ht.HTTPConnection('localhost', 8080)
c.request('POST', '/process', '{"input": ["' + hist[0] + '", "' + hist[1] + '"]}')
predicted = c.getresponse().read().decode('UTF-8')

ans = ' '.join(full_hist) + ' ' + predicted

vim.command("let sInVim = '%s'"% ans)
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
        let sInVim = TestNGram(a:findstart, a:base)
        return [sInVim, "placeholder"]
    endif
endfun

set completefunc=TestComplete2


