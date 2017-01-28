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
return sInVim
endfunction

function! GetCompletionStart(currentline)
python3 << EOF
import vim

this_line = vim.eval('a:currentline')

# splitting the full line
full_hist = this_line.split()

if len(full_hist) < 2:
  # if the there are less than two words, there is nothing to do here
  ans = '-3'
else:
  ans = len(this_line) - len(full_hist[-1]) - len(full_hist[-2]) - 1
  ans = str(ans)

vim.command("let findstartans = %s"% ans)
EOF
return findstartans
endfunction

function! Pandakey(findstart, base)
    if a:findstart
        let findstartans = GetCompletionStart(getline('.'))
        echo findstartans
        return findstartans
    else
        let sInVim = GetNgram(a:findstart, a:base)
        return [sInVim, "placeholder"]
    endif
endfun


