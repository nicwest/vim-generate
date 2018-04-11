" Vimscript Setup: {{{1
let s:save_cpo = &cpo
set cpo&vim

" Vital: {{{1
let s:V = vital#generate#new()
let s:DateTime = s:V.import('DateTime')

" Private Functions: {{{1
function! s:local_function() abort
  echom "change s:local_function"
endfunction

" Library Interface: {{{1
function! generate#datetime#iso8601_date_and_time() abort
  return s:DateTime.now().format('%FT%T%z')
endfunction

function! generate#datetime#iso8601_date() abort
  return s:DateTime.now().format('%F')
endfunction

function! generate#datetime#sql() abort
  return s:DateTime.now().format('%F %T')
endfunction


" Teardown:{{{1
let &cpo = s:save_cpo

" Misc: {{{1
" vim: set ft=vim ts=2 sw=2 tw=78 et fdm=marker:
