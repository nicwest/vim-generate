let s:suite = themis#suite('generate')
let s:assert = themis#helper('assert')
let s:scope = themis#helper('scope')
let s:names = s:scope.vars('autoload/generate/names.vim')
let s:datetime = s:scope.vars('autoload/generate/datetime.vim')

function! s:fake_now(...) abort
  let l:now = s:datetime.DateTime.from_unix_time(1503864575, '+0300')
  return l:now
endfunction

function! s:suite.before() abort
  let s:original_now = s:datetime.DateTime.now
  let s:datetime.DateTime.now = function('s:fake_now')
endfunction

function! s:suite.after() abort
  let s:datetime.DateTime.now = s:original_now
endfunction

function! s:suite.before_each() abort
  call s:names.Random.seed(1) 
endfunction

function! s:suite.after_each() abort
  norm! gg"_dG
endfunction

function! s:suite.gen_name() abort
  Generate name
  call s:assert.equal(getline('.'), 'Tamela Mcgray')
endfunction

function! s:suite.gen_name_full() abort
  Generate full name
  call s:assert.equal(getline('.'), 'Tamela Mcgray')
endfunction

function! s:suite.gen_name_first() abort
  Generate first name
  call s:assert.equal(getline('.'), 'Tamela')
endfunction

function! s:suite.gen_name_first_male() abort
  Generate first male name
  call s:assert.equal(getline('.'), 'Kelley')
endfunction

function! s:suite.gen_name_first_female() abort
  Generate first female name
  call s:assert.equal(getline('.'), 'Charissa')
endfunction

function! s:suite.gen_name_last() abort
  Generate last name
  call s:assert.equal(getline('.'), 'Livingston')
endfunction

function! s:suite.gen_name_last() abort
  Generate stub name
  call s:assert.equal(getline('.'), 't.mcgray')
endfunction

function! s:suite.gen_name_user() abort
  Generate user
  call s:assert.equal(getline('.'), 'tamela_mcgray')
endfunction

function! s:suite.gen_name_email() abort
  Generate email
  call s:assert.equal(getline('.'), 't.mcgray@hairyswift.net')
endfunction

function! s:suite.gen_inet_domain() abort
  Generate domain
  call s:assert.equal(getline('.'), 'radiantoyster.net')
endfunction

function! s:suite.gen_inet_ipv4() abort
  Generate ipv4
  call s:assert.equal(getline('.'), '161.17.88.77')
endfunction

function! s:suite.gen_inet_ipv6() abort
  Generate ipv6
  call s:assert.equal(getline('.'), 'a111:584d:438f:c09d:fd42:f2f7:26e0:49b5')
endfunction

function! s:suite.gen_uuid() abort
  Generate uuid
  call s:assert.equal(getline('.'), 'a211584d-4390-419e-be42-f3f826e149b5')
endfunction

function! s:suite.gen_uuid_v4() abort
  Generate uuid4
  call s:assert.equal(getline('.'), 'a211584d-4390-419e-be42-f3f826e149b5')
endfunction

function! s:suite.gen_iso8601_datetime() abort
  Generate isodatetime
  call s:assert.equal(getline('.'), '2017-08-27T23:09:35+0300')
endfunction

function! s:suite.gen_iso8601_date() abort
  Generate isodate
  call s:assert.equal(getline('.'), '2017-08-27')
endfunction

function! s:suite.gen_sql_datetime() abort
  Generate sqldatetime
  call s:assert.equal(getline('.'), '2017-08-27 23:09:35')
endfunction
