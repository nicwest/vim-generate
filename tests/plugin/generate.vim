let s:suite = themis#suite('generate')
let s:assert = themis#helper('assert')
let s:scope = themis#helper('scope')
let s:names = s:scope.vars('autoload/generate/names.vim')


function! s:suite.before_each() abort
  call s:names.Random.seed(1) 
endfunction

function! s:suite.after_each() abort
  norm! gg"_dG
endfunction

function! s:suite.gen_name() abort
  GenName 
  call s:assert.equal(getline('.'), 'Tamela Mcgray')
endfunction

function! s:suite.gen_name_full() abort
  GenName full
  call s:assert.equal(getline('.'), 'Tamela Mcgray')
endfunction

function! s:suite.gen_name_first() abort
  GenName first
  call s:assert.equal(getline('.'), 'Tamela')
endfunction

function! s:suite.gen_name_first_male() abort
  GenName first male
  call s:assert.equal(getline('.'), 'Kelley')
endfunction

function! s:suite.gen_name_first_female() abort
  GenName first female
  call s:assert.equal(getline('.'), 'Charissa')
endfunction

function! s:suite.gen_name_last() abort
  GenName last
  call s:assert.equal(getline('.'), 'Livingston')
endfunction

function! s:suite.gen_name_last() abort
  GenName stub
  call s:assert.equal(getline('.'), 't.mcgray')
endfunction

function! s:suite.gen_name_user() abort
  GenName user
  call s:assert.equal(getline('.'), 'tamela_mcgray')
endfunction

function! s:suite.gen_inet() abort
  GenInet
  call s:assert.equal(getline('.'), 'radiantoyster.net')
endfunction

function! s:suite.gen_inet_domain() abort
  GenInet domain
  call s:assert.equal(getline('.'), 'radiantoyster.net')
endfunction

function! s:suite.gen_inet_ipv4() abort
  GenInet ipv4
  call s:assert.equal(getline('.'), '161.17.88.77')
endfunction

function! s:suite.gen_inet_ipv6() abort
  GenInet ipv6
  call s:assert.equal(getline('.'), 'a111:584d:438f:c09d:fd42:f2f7:26e0:49b5')
endfunction
