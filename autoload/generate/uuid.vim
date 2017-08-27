" Vimscript Setup: {{{1
let s:save_cpo = &cpo
set cpo&vim

" Vital: {{{1
let s:V = vital#generate#new()
let s:Random = s:V.import('Random')
let s:Bitwise = s:V.import('Bitwise')

" Private Functions: {{{1
function! s:set_version(bytes, version) abort
  let a:bytes[6] = s:Bitwise.or(s:Bitwise.and(a:bytes[6], 0x0f), s:Bitwise.lshift(a:version, 4))
endfunction

function! s:set_varient(bytes) abort
  let a:bytes[8] = s:Bitwise.or(s:Bitwise.and(a:bytes[8], 0xbf), 0x80)
endfunction

" Library Interface: {{{1
function! generate#uuid#v4() abort
  let l:rng = range(256)
  let l:bytes = map(range(16), 's:Random.sample(l:rng)')
  call s:set_version(l:bytes, 4)
  call s:set_varient(l:bytes)
  let l:bytes = map(l:bytes, 'printf(''%02x'', v:val)')
  return join([
        \ join(l:bytes[:3], ''), 
        \ join(l:bytes[4:5], ''), 
        \ join(l:bytes[6:7], ''), 
        \ join(l:bytes[8:9], ''), 
        \ join(l:bytes[10:], '')], '-')
endfunction

" Teardown:{{{1
let &cpo = s:save_cpo

" Misc: {{{1
" vim: set ft=vim ts=2 sw=2 tw=78 et fdm=marker:
