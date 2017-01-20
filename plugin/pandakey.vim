" --------------------------------
" Add our plugin to the path
" --------------------------------
python3 import sys
python3 import vim
python3 sys.path.append(vim.eval('expand("<sfile>:h")'))

function! TestNGram(findstart, base)
python3 << EOF
from __future__ import division
from __future__ import print_function
from builtins import input
import os
import pickle
import vim
from prediction_engine.predict import predict

# printing arguments
print(vim.eval('a:findstart'))
print(vim.eval('a:base'))

pkl_file = 'prediction_engine/nGramData.pkl'
with open(pkl_file, 'rb') as handle:
    dict_words = pickle.load(handle)

hist = "where is"
s = predict(dict_words, hist.split())

# s = "I"
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
        let sInVim = TestNGram(a:findstart, a:base)
        return [sInVim, "and this"]
    endif
endfun

set completefunc=TestComplete2


