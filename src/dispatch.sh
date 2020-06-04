while [ 1 ] 
  do select round in preflop flop turn river 
    do 
      echo $round 
      case $round in
         river) select event in river_flush river_str 
           do echo
             case event in
               river_flushn) ./runit.sh rflush ; break ;;
               river_str) ./runit.sh rstr ; break ;;
               *) echo "oops!" ;; 
             esac
           done ;; 
         turn ) select x in turn_oesd turn_fd 
           do echo
             case x in
               turn_oesd) ./runit.sh toesd ; break ;;
               turn_fd) ./runit.sh tflush; break ;;
               *) echo "oops!" ;; 
             esac
           done ;; 
         flop) select event in flop_set flop_aces flop_backdoor flop_fd flop_oesd 
           do echo 
             case $event in 
               flop_set) ./runit.sh fset ; break ;;
               flop_aces) ./runit.sh faces ; break ;;
               flop_backdoor) ./runit.sh foesd_hole ; break ;;
               flop_fd) ./runit.sh ffd ; break ;;
               flop_oesd) ./runit.sh foesd_conn ; break ;;
               *) echo "oops!" ;;
             esac 
           done ;;
         preflop) select event in ace_ace over 
           do echo 
             case $event in 
               ace_ace) ./runit.sh pace_ace ; break ;;
               over) ./runit.sh popp_over ; break ;;
               *) echo "oops!" ;;
             esac 
           done ;;
         *) echo "oops!" ;;
       esac 
     done
   done
