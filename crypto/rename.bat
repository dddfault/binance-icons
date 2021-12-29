@echo off
for /F "tokens=1,* delims=_" %%a in ('dir /A-D /B "*.png"') do (
    move "%%a_%%b" "%%a%%~xb"
)


@ECHO OFF
  FOR %a in (*.png) DO (
    REN "*.png" "*_*.png"
    magick mogrify -gravity Center -crop 32x32+0+0 +repage *.png
    magick *.png -depth 8 -set filename:f "%[hex:u.p{0,0}]" %[filename:f].png
  )
  
  
for %I in ( *.png ) do ( magick %I -resize 1x1! txt: ^
   | sed -e "s/^#.*$//g;s/^.* #\(.*\)  .*$/ren %I \1\.png/g" >> fixnames.bat )