"
" Determine if a triangle is equilateral, isosceles, or scalene.
"
" An equilateral triangle has all three sides the same length.
"
" An isosceles triangle has at least two sides the same length.
" (It is sometimes specified as having exactly two sides the
" same length, but for the purposes of this exercise we'll say
" at least two.)
"
" A scalene triangle has all sides of different lengths.
"

function! Equilateral(triangle) abort
  return Valid(a:triangle)
    \ && (a:triangle[0] == a:triangle[1] && a:triangle[1] == a:triangle[2])
endfunction

function! Isosceles(triangle) abort
  return Valid(a:triangle)
    \ && (a:triangle[1] == a:triangle[2] || a:triangle[0] == a:triangle[1] || a:triangle[0] == a:triangle[2])
endfunction

function! Scalene(triangle) abort
  return Valid(a:triangle) 
    \ && (a:triangle[0] != a:triangle[1] && a:triangle[1] != a:triangle[2])
endfunction

function! Valid(triangle) abort
  return !(a:triangle[0] > a:triangle[1]+a:triangle[2])
    \ && !(a:triangle[1] > a:triangle[0]+a:triangle[2])
    \ && !(a:triangle[2] > a:triangle[0]+a:triangle[1])
    \ && !(a:triangle[0] == 0 && a:triangle[1] == 0 && a:triangle[2] == 0)
endfunction
