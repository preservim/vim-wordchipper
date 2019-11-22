" ============================================================================
" File:        plugin/wordchipper.vim
" Description: vim-wordchipper plugin
" Maintainer:  Reed Esau <github.com/reedes>
" Created:     November 22, 2019
" License:     The MIT License (MIT)
" ============================================================================

if &cp || exists('g:wordchipper#loaded') | finish | endif
let g:wordchipper#loaded = 1

" Save 'cpoptions' and set Vim default to enable line continuations.
let s:save_cpo = &cpo
set cpo&vim

if !exists('g:wordchipper#autoformat')
  " user-overridable default, to enable autoformat (if active)
  let g:wordchipper#autoformat = 1
en

let &cpo = s:save_cpo
unlet s:save_cpo
" vim:ts=2:sw=2:sts=2

