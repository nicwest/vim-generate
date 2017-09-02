let s:suite = themis#suite('inet')
let s:assert = themis#helper('assert')
let s:scope = themis#helper('scope')
let s:inet = s:scope.vars('autoload/generate/inet.vim')


function! s:suite.before_each() abort
  call s:inet.Random.seed(1) 
endfunction

function! s:suite.domain() abort
  call s:assert.equals(generate#inet#domain(), "radiantoyster.net")
  call s:assert.equals(generate#inet#domain(), "fragrantaardwolf.org")
  call s:assert.equals(generate#inet#domain(), "singingcopperhead.co.uk")
endfunction

function! s:suite.ipv4() abort
  call s:assert.equals(generate#inet#ipv4(), "161.17.88.77")
  call s:assert.equals(generate#inet#ipv4(), "67.143.192.157")
  call s:assert.equals(generate#inet#ipv4(), "253.66.242.247")
endfunction

function! s:suite.ipv6() abort
  call s:assert.equals(generate#inet#ipv6(), 'a111:584d:438f:c09d:fd42:f2f7:26e0:49b5')
  call s:assert.equals(generate#inet#ipv6(), '97fb:8664:55e2:ed1b:4244:8031:f1c3:384c')
  call s:assert.equals(generate#inet#ipv6(), 'b917:7199:66d0:8785:8526:0a81:6f61:e02f')
endfunction

