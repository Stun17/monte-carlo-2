as :: [Int]
as = [2,6,23,1,16]

bubble :: [Int] -> [Int]
bubble []       = []
bubble [x]      = [x]
bubble (x:y:zs) = 
  if x > y 
  then y:(bubble (x:zs)) 
  else x:(bubble (y:zs))

bubble5 :: [Int] -> Either String [Int]
bubble5 bs =
  if length bs /= 5 
  then Left "wrong size!" 
  else 
    let 
      zs = bubble bs 
      z  = last zs 
      ys = bubble (init zs) 
      y  = last ys
      xs = bubble (init ys) 
      x  = last xs
      ws = bubble (init xs) 
      w  = last ws
      v  = head ws
    in  Right [v,w,x,y,z]
