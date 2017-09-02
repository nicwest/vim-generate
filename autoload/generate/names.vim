" Vimscript Setup: {{{1
let s:save_cpo = &cpo
set cpo&vim

" Vital: {{{1
let s:V = vital#generate#new()
let s:Random = s:V.import('Random')

" Data: {{{1
let s:male = [
      \ "Roscoe", "Leo", "Mathew", "Kurtis", "Heriberto", "Ralph", "Edmund",
      \ "Wilbert", "Andres", "Johnny", "Cecil", "Jermaine", "Sang", "Vince",
      \ "Trey", "Lowell", "Gus", "Brad", "Alexis", "Terrell", "Chase",
      \ "Ellsworth", "Philip", "Will", "Brant", "Gerry", "Cole", "Barney",
      \ "Henry", "Emilio", "Octavio", "Kelley", "Nathanael", "Quincy",
      \ "Delbert", "Bobbie", "Silas", "Rod", "Roberto", "Earnest", "Chong",
      \ "Stephen", "Rick", "Kelly", "Jimmie", "Ed", "Stevie", "Luigi", "Adrian",
      \ "Vern",
      \ ]

let s:female = [
      \ "Elise", "Lorretta", "Malinda", "Analisa", "Alica", "Gertude",
      \ "Cortney", "Ria", "Lori", "Tameika", "Gisela", "Sharika", "Wonda",
      \ "Tamela", "Ludie", "Dalene", "Lorri", "Louise", "Phyllis", "Kina",
      \ "Elfrieda", "Amada", "Vikki", "Makeda", "Elois", "Jenee", "Hae",
      \ "Jacklyn", "Carolina", "Maura", "Vesta", "Charissa", "Palma", "Judie",
      \ "Therese", "Sharyl", "Trina", "Lucilla", "Hsiu", "Alda", "Debbie",
      \ "Thea", "Suzan", "Vallie", "Taneka", "Tran", "Sharen", "Nohemi",
      \ "Caterina", "Takisha",
      \ ]

let s:first = s:male + s:female

let s:last = [
      \ 'Lawry', 'Tiggs', 'Quist', 'Mcgray', 'Brewton', 'Haigh', 'Kubala',
      \ 'Stringer', 'Grahm', 'Sanborn', 'Bleau', 'Hake', 'Bottoms', 'Parent',
      \ 'Burwell', 'Atienza', 'Ferro', 'Isherwood', 'Geesey', 'Mackley',
      \ 'Molino', 'Sanderson', 'Alexandria', 'Adamson', 'Lenhardt', 'Rambo',
      \ 'Tacey', 'Loth', 'Clement', 'Garfield', 'Wnuk', 'Livingston',
      \ 'Dingee', 'Rozell', 'Mo', 'Whistler', 'Jump', 'Arviso', 'Rivenburg',
      \ 'Clark', 'Fadden', 'Pankey', 'Abercrombie', 'Felkins', 'Housel',
      \ 'Killoran', 'Reiff', 'Statton', 'Duford', 'Lakin',
      \ ]

" Private Functions: {{{1
function! s:full_name(first, last) abort
  return printf('%s %s', a:first, a:last)
endfunction

function! s:stub(first, last) abort
  return tolower(printf('%s.%s', a:first[0], a:last))
endfunction

function! s:username(first, last) abort
  return tolower(printf('%s_%s', a:first, a:last))
endfunction

function! s:email(stub, domain) abort
  return printf('%s@%s', a:stub, a:domain)
endfunction

" Library Interface: {{{1
function! generate#names#first() abort
  return s:Random.sample(s:first)
endfunction

function! generate#names#first_male() abort
  return s:Random.sample(s:male)
endfunction

function! generate#names#first_female() abort
  return s:Random.sample(s:female)
endfunction

function! generate#names#last() abort
  return s:Random.sample(s:last)
endfunction

function! generate#names#full() abort
  return s:full_name(generate#names#first(), generate#names#last())
endfunction

function! generate#names#stub() abort
  return s:stub(generate#names#first(), generate#names#last())
endfunction

function! generate#names#user() abort
  return s:username(generate#names#first(), generate#names#last())
endfunction

function! generate#names#email() abort
  let l:stub = s:stub(generate#names#first(), generate#names#last())
  return s:email(l:stub, generate#inet#domain())
endfunction

" Teardown:{{{1
let &cpo = s:save_cpo

" Misc: {{{1
" vim: set ft=vim ts=2 sw=2 tw=78 et fdm=marker:
