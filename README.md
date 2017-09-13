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
imap <C-g>nf <Plug>GenFirstName
imap <C-g>ny <Plug>GenFirstMaleName
imap <C-g>nx <Plug>GenFirstFemaleName
imap <C-g>nl <Plug>GenLastName
imap <C-g>nn <Plug>GenFullName
imap <C-g>ns <Plug>GenStubName
imap <C-g>nu <Plug>GenUserName
imap <C-G>em <Plug>GenEmail
imap <C-G>id <Plug>GenDomain
imap <C-G>ip <Plug>GenIPV4
imap <C-G>ix <Plug>GenIPV6
imap <C-g>uu <Plug>GenUUID4
imap <C-g>dt <Plug>GenIso8601DateTime

nnoremap gennf :Gen first name<CR>
nnoremap genny :Gen first male name<CR>
nnoremap gennx :Gen first female name<CR>
nnoremap gennl :Gen last name<CR>
nnoremap gennn :Gen full name<CR>
nnoremap genns :Gen stub<CR>
nnoremap gennu :Gen user<CR>
nnoremap genem :Gen email<CR>
nnoremap genid :Gen domain<CR>
nnoremap genip :Gen ipv4<CR>
nnoremap genix :Gen ipv6<CR>
nnoremap genuu :Gen uuid<CR>
nnoremap gendt :Gen datetime<CR>
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
