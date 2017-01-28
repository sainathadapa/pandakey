" --------------------------------
" Add our plugin to the path
" --------------------------------
python3 import sys
python3 import vim
python3 sys.path.append(vim.eval('expand("<sfile>:h")'))

function! GetNgram(findstart, base)
python3 << EOF
import http.client as ht
import vim

# printing arguments
print(vim.eval('a:findstart'))
print(vim.eval('a:base'))

# splitting the full line
full_hist = vim.eval('a:base').split()

if len(full_hist) < 2:
  # if the there are less than two words, there is nothing to do here
  ans = ''
else:
  # getting the last two words
  hist = full_hist[-2:]
  # connecting to the server and getting predictions
  c = ht.HTTPConnection('localhost', 8080)
  c.request('POST', '/process', '{"input": ["' + hist[0] + '", "' + hist[1] + '"]}')
  predicted = c.getresponse().read().decode('UTF-8')
  # joining the prediction with the original data
  ans = ' '.join(full_hist) + ' ' + predicted

vim.command("let sInVim = '%s'"% ans)
EOF
echo sInVim
return sInVim
endfunction

function! Pandakey(findstart, base)
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
        let sInVim = GetNgram(a:findstart, a:base)
        return [sInVim, "placeholder"]
    endif
endfun


