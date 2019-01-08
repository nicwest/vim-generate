let s:suite = themis#suite('datetime')
let s:assert = themis#helper('assert')
let s:scope = themis#helper('scope')
let s:datetime = s:scope.vars('autoload/generate/datetime.vim')

" patch vital lib for test consistancy
function! s:fake_now(...) abort
  let now = s:datetime.DateTime.from_unix_time(1511813375, "+0300")
  return now
endfunction

function! s:suite.before() abort
  let s:original_now = s:datetime.DateTime.now
  let s:datetime.DateTime.now = function('s:fake_now')
endfunction

function! s:suite.after() abort
  let s:datetime.DateTime.now = s:original_now
endfunction

function! s:suite.iso8601_date_and_time() abort
  call s:assert.equals(generate#datetime#iso8601_date_and_time(), "2017-11-27T23:09:35+0300")
endfunction

function! s:suite.iso8601_date() abort
  call s:assert.equals(generate#datetime#iso8601_date(), "2017-11-27")
endfunction

function! s:suite.sql() abort
  call s:assert.equals(generate#datetime#sql(), "2017-11-27 23:09:35")
endfunction

function! s:suite.unix() abort
  call s:assert.equals(generate#datetime#unix(), "1511813375")
endfunction
