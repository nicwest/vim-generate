let s:suite = themis#suite('names')
let s:assert = themis#helper('assert')
let s:scope = themis#helper('scope')
let s:names = s:scope.vars('autoload/generate/names.vim')
let s:inet = s:scope.vars('autoload/generate/names.vim')


function! s:suite.before_each() abort
  call s:names.Random.seed(1) 
  call s:inet.Random.seed(1) 
endfunction

function! s:suite.first() abort
  call s:assert.equals(generate#names#first(), "Tamela")
  call s:assert.equals(generate#names#first(), "Edmund")
  call s:assert.equals(generate#names#first(), "Delbert")
endfunction

function! s:suite.first_male() abort
  call s:assert.equals(generate#names#first_male(), "Kelley")
  call s:assert.equals(generate#names#first_male(), "Kurtis")
  call s:assert.equals(generate#names#first_male(), "Brad")
endfunction

function! s:suite.first_female() abort
  call s:assert.equals(generate#names#first_female(), "Charissa")
  call s:assert.equals(generate#names#first_female(), "Analisa")
  call s:assert.equals(generate#names#first_female(), "Louise")
endfunction

function! s:suite.last() abort
  call s:assert.equals(generate#names#last(), "Livingston")
  call s:assert.equals(generate#names#last(), "Mcgray")
  call s:assert.equals(generate#names#last(), "Isherwood")
endfunction

function! s:suite.full() abort
  call s:assert.equals(generate#names#full(), "Tamela Mcgray")
  call s:assert.equals(generate#names#full(), "Delbert Atienza")
  call s:assert.equals(generate#names#full(), "Cole Clement")
endfunction

function! s:suite.stub() abort
  call s:assert.equals(generate#names#stub(), "t.mcgray")
  call s:assert.equals(generate#names#stub(), "d.atienza")
  call s:assert.equals(generate#names#stub(), "c.clement")
endfunction

function! s:suite.user() abort
  call s:assert.equals(generate#names#user(), "tamela_mcgray")
  call s:assert.equals(generate#names#user(), "delbert_atienza")
  call s:assert.equals(generate#names#user(), "cole_clement")
endfunction

function! s:suite.email() abort
  call s:assert.equals(generate#names#email(), 't.mcgray@hairyswift.net')
  call s:assert.equals(generate#names#email(), 'c.arviso@quirkytoad.net')
  call s:assert.equals(generate#names#email(), 't.duford@capedtiger.net')
endfunction
