let s:suite = themis#suite('datetime')
let s:assert = themis#helper('assert')
let s:scope = themis#helper('scope')
let s:datetime = s:scope.vars('autoload/generate/datetime.vim')

" patch vital lib for test consistancy
function! s:fake_now(...) abort
  let now = s:datetime.DateTime.from_unix_time(1503864575, "+0300")
  return now
endfunction

function! s:suite.before() abort
  let s:original_now = s:datetime.DateTime.now
  let s:datetime.DateTime.now = function('s:fake_now')
endfunction

function! s:suite.after() abort
  let s:datetime.DateTime.now = s:original_now
endfunction

function! s:suite.iso8601() abort
  call s:assert.equals(generate#datetime#iso8601(), "2017-08-27T23:09:35+0300")
endfunction

