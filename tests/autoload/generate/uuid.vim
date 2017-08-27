let s:suite = themis#suite('uuid')
let s:assert = themis#helper('assert')
let s:scope = themis#helper('scope')
let s:uuid = s:scope.vars('autoload/generate/uuid.vim')


function! s:suite.before_each() abort
  call s:uuid.Random.seed(1) 
endfunction

function! s:suite.v4() abort
  call s:assert.equals(generate#uuid#v4(), 'a211584d-4390-419e-be42-f3f826e149b5')
  call s:assert.equals(generate#uuid#v4(), '98fc8764-55e3-4e1b-8344-8032f2c4384d')
  call s:assert.equals(generate#uuid#v4(), 'ba17719a-66d1-4785-8626-0a827061e12f')
endfunction
