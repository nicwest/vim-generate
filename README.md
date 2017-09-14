[![Build Status](https://travis-ci.org/nicwest/vim-generate.svg?branch=master)](https://travis-ci.org/nicwest/vim-generate)
[![Powered by vital.vim](https://img.shields.io/badge/powered%20by-vital.vim-80273f.svg)](https://github.com/vim-jp/vital.vim)

vim-generate
============

Generate assorted things

Usage
-----

```viml
" in normal mode all commands insert the thing before the cursor

" Names:
:Gen full name            " a full name (e.g. Fred Flintstone)
:Gen name                 " a full name (e.g. Fred Flintstone)
:Gen first name           " a first name (e.g. Fred)
:Gen first male name      " a male first name (e.g. Fred)
:Gen first female name    " a female first name (e.g. Wilma)
:Gen last name            " a last name (e.g. Flintstone)
:Gen stub                 " a shortened lower case name (e.g. f.flinstone)
:Gen user                 " a lower case username (e.g. fred_flintstone)
:Gen email                " a lower case username (e.g. f.flintstone@rockslateandgravel.com)

:Gen domain               " a domain name (e.g. rockslateandgravel.com)
:Gen ipv4                 " an ipv4 address (e.g. 125.54.120.71)
:Gen ipv6                 " an ipv6 address (e.g. 9dbc:aef0:8ba4:6416:3fea:2e44:fed7:3215)

" UUIDs:
:Gen uuid                 " a UUID (e.g. 13d9f2aa-76b7-4a51-8c89-f755d4e8f470)
:Gen uuid4                " a UUID v4 (e.g. 13d9f2aa-76b7-4a51-8c89-f755d4e8f470)

" Dates and Times:
:Gen datetime             " a ISO8601 Date Time (e.g. 2017-08-27T20:58:00+0100)

```

Suggested Mappings
------------------

generate doesn't bind anything by default. These are what I am currently using:

```viml
imap <C-g>nf <Plug>GenerateFirstName
imap <C-g>ny <Plug>GenerateFirstMaleName
imap <C-g>nx <Plug>GenerateFirstFemaleName
imap <C-g>nl <Plug>GenerateLastName
imap <C-g>nn <Plug>GenerateFullName
imap <C-g>ns <Plug>GenerateStubName
imap <C-g>nu <Plug>GenerateUserName
imap <C-G>em <Plug>GenerateEmail
imap <C-G>id <Plug>GenerateDomain
imap <C-G>ip <Plug>GenerateIPV4
imap <C-G>ix <Plug>GenerateIPV6
imap <C-g>uu <Plug>GenerateUUID4
imap <C-g>dt <Plug>GenerateIso8601DateTime

nnoremap gennf :Generate first name<CR>
nnoremap genny :Generate first male name<CR>
nnoremap gennx :Generate first female name<CR>
nnoremap gennl :Generate last name<CR>
nnoremap gennn :Generate full name<CR>
nnoremap genns :Generate stub<CR>
nnoremap gennu :Generate user<CR>
nnoremap genem :Generate email<CR>
nnoremap genid :Generate domain<CR>
nnoremap genip :Generate ipv4<CR>
nnoremap genix :Generate ipv6<CR>
nnoremap genuu :Generate uuid<CR>
nnoremap gendt :Generate datetime<CR>
```

Tests
-----

To run the tests pull the [themis test
suite](https://github.com/thinca/vim-themis) (you don't have to install it but
you can if you want).

```
git clone git@github.com:thinca/vim-themis.git
./vim-themis/bin/themis --reporter dot test
```

Alternatively you can use the Makefile in the root dir, which will clone the
dependencies and run the tests and linter.

```
make init
make test
make lint
```
