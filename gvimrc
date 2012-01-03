color vwilight
set guifont=Menlo\ Regular:h14
set linespace=2
set antialias

" Remove scrollbars
set guioptions-=r
set guioptions-=L

" Don't beep
set visualbell

" Start without the toolbar
set guioptions-=T

if has("gui_macvim")
  " Fullscreen takes up entire screen
  set fuoptions=maxhorz,maxvert
end
