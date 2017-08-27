" Vimscript Setup: {{{1
let s:save_cpo = &cpo
set cpo&vim

" load guard
" uncomment after plugin development.
"if exists("g:loaded_generate")
"  let &cpo = s:save_cpo
"  finish
"endif
"let g:loaded_generate = 1

" Private Interface: {{{1
function! s:generate(thing) abort
  execute "norm! i" . a:thing
endfunction

function! s:gen_name(type) abort
  if a:type == "first"
    let l:thing = generate#names#first()
  elseif a:type == "first male"
    let l:thing = generate#names#first_male()
  elseif a:type == "first female"
    let l:thing = generate#names#first_female()
  elseif a:type == "last"
    let l:thing = generate#names#last()
  elseif a:type == "stub"
    let l:thing = generate#names#stub()
  elseif a:type == "user"
    let l:thing = generate#names#user()
  else
    let l:thing = generate#names#full()
  endif
  call s:generate(l:thing)
endfunction

function! s:gen_uuid(...) abort
  let l:thing = generate#uuid#v4()
  call s:generate(l:thing)
endfunction

function! s:gen_date_time(...) abort
  let l:thing = generate#datetime#iso8601()
  call s:generate(l:thing)
endfunction

" Maps: {{{1
imap <Plug>GenFirstName <C-R>=generate#names#first()<CR>
imap <Plug>GenFirstMaleName <C-R>=generate#names#first_male()<CR>
imap <Plug>GenFirstFemaleName <C-R>=generate#names#first_female()<CR>
imap <Plug>GenLastName <C-R>=generate#names#last()<CR>
imap <Plug>GenFullName <C-R>=generate#names#full()<CR>
imap <Plug>GenStubName <C-R>=generate#names#stub()<CR>
imap <Plug>GenUserName <C-R>=generate#names#user()<CR>

imap <Plug>GenUUID4 <C-R>=generate#uuid#v4()<CR>

imap <Plug>GenIso8601DateTime <C-R>=generate#datetime#iso8601()<CR>

" Commands: {{{1
command! -nargs=* -bar GenName call s:gen_name(<q-args>)
command! -nargs=* -bar GenUUID call s:gen_uuid(<q-args>)
command! -nargs=* -bar GenDateTime call s:gen_date_time(<q-args>)


" Teardown: {{{1
let &cpo = s:save_cpo

" Misc: {{{1
" vim: set ft=vim ts=2 sw=2 tw=78 et fdm=marker:
