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
function! s:generate(t) abort
  if a:t == "name" || a:t == "full name"
    let l:thing = generate#names#full()
  elseif a:t == "first name"
    let l:thing = generate#names#first()
  elseif a:t == "first male name"
    let l:thing = generate#names#first_male()
  elseif a:t == "first female name"
    let l:thing = generate#names#first_female()
  elseif a:t == "last name"
    let l:thing = generate#names#last()
  elseif a:t == "stub name"
    let l:thing = generate#names#stub()
  elseif a:t == "user"
    let l:thing = generate#names#user()
  elseif a:t  == "email"
    let l:thing = generate#names#email()
  elseif a:t == 'uuid' || a:t == 'uuid4'
    let l:thing = generate#uuid#v4()
  elseif a:t == 'datetime'
    let l:thing = generate#datetime#iso8601()
  elseif a:t == 'ipv4'
    let l:thing = generate#inet#ipv4()
  elseif a:t == 'ipv6'
    let l:thing = generate#inet#ipv6()
  elseif a:t == 'domain'
    let l:thing = generate#inet#domain()
  else
    let l:thing = generate#rage#random()
  endif
  execute "norm! i" . l:thing
endfunction


" Maps: {{{1
imap <Plug>GenFirstName <C-R>=generate#names#first()<CR>
imap <Plug>GenFirstMaleName <C-R>=generate#names#first_male()<CR>
imap <Plug>GenFirstFemaleName <C-R>=generate#names#first_female()<CR>
imap <Plug>GenLastName <C-R>=generate#names#last()<CR>
imap <Plug>GenFullName <C-R>=generate#names#full()<CR>
imap <Plug>GenStubName <C-R>=generate#names#stub()<CR>
imap <Plug>GenUserName <C-R>=generate#names#user()<CR>
imap <Plug>GenEmail <C-R>=generate#names#email()<CR>

imap <Plug>GenDomain <C-R>=generate#inet#domain()<CR>
imap <Plug>GenIPV4 <C-R>=generate#inet#ipv4()<CR>
imap <Plug>GenIPV6 <C-R>=generate#inet#ipv6()<CR>

imap <Plug>GenUUID4 <C-R>=generate#uuid#v4()<CR>

imap <Plug>GenIso8601DateTime <C-R>=generate#datetime#iso8601()<CR>

" Commands: {{{1
command! -nargs=* -bar Gen call s:generate(<q-args>)


" Teardown: {{{1
let &cpo = s:save_cpo

" Misc: {{{1
" vim: set ft=vim ts=2 sw=2 tw=78 et fdm=marker:
