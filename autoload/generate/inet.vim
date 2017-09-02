" Vimscript Setup: {{{1
let s:save_cpo = &cpo
set cpo&vim

" Vital: {{{1
let s:V = vital#generate#new()
let s:Random = s:V.import('Random')

" Data: {{{1
" parts from https://github.com/alexanderlukanin13/coolname/tree/master/coolname/data
let s:adjectives = [
      \ "acrid", "ambrosial", "amorphous", "armored", "aromatic", "bald",
      \ "blazing", "boisterous", "bouncy", "brawny", "bulky", "camouflaged",
      \ "caped", "chubby", "curvy", "elastic", "ethereal", "fat", "feathered",
      \ "fiery", "flashy", "flat", "fluffy", "foamy", "fragrant", "furry",
      \ "fuzzy", "glaring", "hairy", "heavy", "hissing", "horned", "icy",
      \ "imaginary", "invisible", "lean", "loud", "loutish", "lumpy", "lush",
      \ "masked", "meaty", "messy", "misty", "nebulous", "noisy",
      \ "nondescript", "organic", "purring", "quiet", "quirky", "radiant",
      \ "roaring", "ruddy", "rustling", "screeching", "shaggy", "shapeless",
      \ "shiny", "silent", "silky", "singing", "skinny", "smooth", "soft",
      \ "spicy", "spiked", "statuesque", "sticky", "tacky", "tall",
      \ "tangible", "tentacled", "thick", "thundering", "venomous", "warm",
      \ "weightless", "whispering", "winged", "wooden", 
      \ ]

let s:animals = [
      \ "mouse", "coyote", "angelfish", "cheetah", "scallop", "cougar",
      \ "oyster", "jaybird", "chameleon", "porcupine", "markhor", "starling",
      \ "leopard", "wallaby", "bettong", "panther", "koala", "mayfly",
      \ "seriema", "caracara", "dove", "kudu", "crab", "avocet", "dinosaur",
      \ "cricket", "aardwolf", "loon", "goat", "caterpillar", "swift",
      \ "nautilus", "leech", "marmoset", "manul", "asp", "tortoise", "serval",
      \ "boa", "pudu", "snake", "lizard", "beaver", "vole", "quetzal",
      \ "dormouse", "cassowary", "marten", "robin", "kakapo", "stoat",
      \ "crane", "tuna", "lobster", "hound", "cow", "agama", "bull",
      \ "orangutan", "bobcat", "curassow", "hare", "copperhead", "seagull",
      \ "squirrel", "caribou", "lorikeet", "myna", "gila", "goose", "ferret",
      \ "wrasse", "goldfish", "buzzard", "groundhog", "peccary", "viper",
      \ "wolf", "jacamar", "macaque", "hummingbird", "coucal", "jaguar",
      \ "trout", "raptor", "clam", "rook", "mink", "tiger", "uakari",
      \ "walrus", "grouse", "eel", "bee", "koel", "seahorse", "lemur",
      \ "perch", "crayfish", "oarfish", "toad", 
      \ ]

let s:tlds = ["com", "net", "org", "edu", "co.uk"]

let s:bytes = range(255)

" Library Interface: {{{1
function! generate#inet#domain() abort
  return printf(
        \ "%s%s.%s",
        \ s:Random.sample(s:adjectives),
        \ s:Random.sample(s:animals),
        \ s:Random.sample(s:tlds),
        \ )
endfunction

function! generate#inet#ipv4() abort
  return printf(
        \ "%d.%d.%d.%d",
        \ s:Random.sample(s:bytes),
        \ s:Random.sample(s:bytes),
        \ s:Random.sample(s:bytes),
        \ s:Random.sample(s:bytes),
        \ )
endfunction

function! generate#inet#ipv6() abort
  let l:blocks = map(range(16), 'printf("%02x", s:Random.sample(s:bytes))')
  let l:addr = map(range(8), 'join(l:blocks[(v:val * 2) : (v:val * 2) + 1], "")')
  return join(l:addr, ':')
endfunction


" Teardown:{{{1
let &cpo = s:save_cpo

" Misc: {{{1
" vim: set ft=vim ts=2 sw=2 tw=78 et fdm=marker:
