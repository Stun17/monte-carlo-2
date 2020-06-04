head -3 $1.s | grep '#'     # put out function description
./$1.out | od -d |          # convert binary output into decimal output 
    awk -e 'NR == 1 { printf "pocket : %4.2f\nresult : %4.2f\n", $3/65535, $2/$3  }'  
