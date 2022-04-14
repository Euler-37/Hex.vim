" Hex.vim
" Author:      Euler-37
" Version:      0.0.1
"
"----------------------------------------------"
" convert Hex to integer and real number
"----------------------------------------------"
if exists("g:loaded_hex") || &cp || v:version < 700
  finish
endif
let g:loaded_hex = 1

function! ConvertHex(kind)
python3 << EOF
import vim
import struct
import re

def Convert_Hex():
    kind=int(vim.eval("a:kind"))
    dict={4:('>f','>i','<f','<i'),8:('>d','>q','<d','<q')}
    ""cb = vim.current.buffer
    cw = vim.current.window
    (col,row) = cw.cursor
    #line=cb[col-1]
    line=vim.current.line
    line=line[row:].replace(' ','')
    word=line[:16]
    len_word=len(word)
    if len_word<kind*2:
        word=(kind*2-len_word)*"0"+word
    else:
        word=word[0:kind*2]
    output=[]
    if re.findall(r'[^0-9a-fA-F]',word):
        print(re.findall(r'[^0-9a-fA-F]',word))
        print("NOT a HEX")
        return
    print("kind=:",kind,"Hex=:",word)
    (_fb,_ib,_fl,_il)=dict[kind]
    print("float,   big-endian:",struct.unpack(_fb, bytes.fromhex(word))[0])
    print("int  ,   big-endian:",struct.unpack(_ib, bytes.fromhex(word))[0])
    print("float,little-endian:",struct.unpack(_fl, bytes.fromhex(word))[0])
    print("int  ,little-endian:",struct.unpack(_il, bytes.fromhex(word))[0])
Convert_Hex()
EOF
endfunction
command! -nargs=1 Hex call ConvertHex(<f-args>)
" vim:set ft=vim sw=4 sts=4 et:
