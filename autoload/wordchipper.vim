" ============================================================================
" File:        autoload/wordchipper.vim
" Description: autoload functions for vim-wordchipper plugin
" Maintainer:  Reed Esau <github.com/reedes>
" Created:     November 22, 2019
" License:     The MIT License (MIT)
" ============================================================================

if &cp || exists('g:wordchipper#autoloaded') | fini | en

fun! wordchipper#chipWith(command)
  if mode() == 'i'
    let af = g:wordchipper#autoformat && !&wrap && &fo =~# 'a'
    return "\<c-o>" . a:command . (l:af ? "\<c-o>gw}" : "")
  else
    return a:command
  endif
endf

let g:wordchipper#autoloaded = 1
