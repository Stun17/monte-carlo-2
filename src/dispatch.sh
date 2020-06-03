while [ 1 ] ; do 
  select y in preflop flop turn river 
  do 
    echo $y 
    case $y in
      river) ;; 
      turn ) ;;  
      flop) select x in set aces hole flush conn 
            do echo 
              case $x in 
                set) 
                  if [[ -e set.out ]] ; then ./runit.sh set ; else make set.out ; fi ; break ;;
                aces) 
                  if [[ -e aces.out ]] ; then ./runit.sh aces ; else make aces.out ; fi ; break ;;
                hole) 
                  if [[ -e hole.out ]] ; then ./runit.sh hole ; else make hole.out ; fi ; break ;;
                flush) 
                  if [[ -e flush.out ]] ; then ./runit.sh flush ; else make flush.out ; fi ; break ;;
                conn) 
                  if [[ -e conn.out ]] ; then ./runit.sh conn ; else make conn.out ; fi ; break ;;
                *) 
                  echo "oops!" ;;
              esac 
            done ;;
      preflop) select z in ace_ace over 
               do echo 
                 case $z in 
                   ace_ace)  if [[ -e ace_ace.out ]] 
                           then ./runit.sh ace_ace 
                           else make ace_ace.out 
                           fi 
                           break ;;
                   over)  if [[ -e opp_over.out ]] 
                           then ./runit.sh opp_over 
                           else make opp_over.out 
                           fi 
                           break ;;
                   *)     echo "oops!" ;;
                 esac 
               done ;;
      *) echo "oops!" ;;
    esac 
  done 
done
