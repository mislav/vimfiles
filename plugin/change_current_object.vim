" Defines `;` to select the object currently below the cursor.
" Intended for use when positioned above an opening or closing quote/bracket.
"
" Examples:
"
"   Move to a string, change inside it:         f" ci;
"   Search for a bracket, delete whole object:  /{ da;

onoremap a; :<c-u>call <SID>TextObjectCursorCharacter('a')<cr>
xnoremap a; :<c-u>call <SID>TextObjectCursorCharacter('a')<cr>
onoremap i; :<c-u>call <SID>TextObjectCursorCharacter('i')<cr>
xnoremap i; :<c-u>call <SID>TextObjectCursorCharacter('i')<cr>

function! s:TextObjectCursorCharacter(motion)
  let char = getline('.')[col('.')-1]
  exec 'normal! v' . a:motion . char
endfunction
