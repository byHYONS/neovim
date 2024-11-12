" nuovo gruppo di sintassi per le parentesi
syntax match bladeParentheses /[(){}[\]]/

" regione per i parametri delle direttive Blade, includendo le parentesi
syntax region bladeStringaDirettiva start=/(*\zs'/ end=/'/ contains=bladeDirectiveString,bladeDirectiveStringContent keepend extend
" cattura la stringa all'interno dei parametri
syntax match bladeDirectiveString /['][^']*[']/ contained
" cattura il contenuto all'interno delle virgolette
syntax match bladeDirectiveStringContent /[']\zs[^']*\ze[']/ contained
" cattura le parentesi all'interno dei parametri delle direttive
syntax match bladeDirectiveParen /[()]/ contained

" cattura i commenti Blade
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
