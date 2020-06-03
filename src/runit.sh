head -1 $1.s 
./$1.out | od -d | sed 2d | 
  awk -e '{printf "pocket : %4.2f\nresult : %4.2f\n", $3/65535, $2/$3  }'  
