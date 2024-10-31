" Definisci un nuovo gruppo di sintassi per le parentesi
syntax match bladeParentheses /[(){}[\]]/

" Definisci una regione per i parametri delle direttive Blade, includendo le parentesi
syntax region bladeStringaDirettiva start=/(*\zs'/ end=/'/ contains=bladeDirectiveString,bladeDirectiveStringContent keepend extend
" Cattura la stringa all'interno dei parametri
syntax match bladeDirectiveString /['][^']*[']/ contained
" Cattura il contenuto all'interno delle virgolette
syntax match bladeDirectiveStringContent /[']\zs[^']*\ze[']/ contained
" Cattura le parentesi all'interno dei parametri delle direttive
syntax match bladeDirectiveParen /[()]/ contained

" Cattura i commenti Blade
syntax region commentBlade matchgroup=commentBlade start=/{{--/ end=/--}}/ keepend extend fold contains=NONE


" sintassi:
" :help syntax
" :help syn-match
" :help syn-region
" :help syn-contained
" :help syn-contains
" :help regex
" :help pattern
" :help syn-pattern
