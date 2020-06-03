read myvar  
# printf "%b" $myvar > te.txt 
printf "0: %.4x" $myvar | xxd -r -g0 > te.txt 
hexdump te.txt 
