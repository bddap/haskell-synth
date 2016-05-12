module Main where

import Gensounds
import GensoundsUtil (play)
import Data.List (genericLength, tails)
import Data.Ratio ((%))
import Data.Hashable (hash,Hashable)
import Timbres (arch)

main = gen "song.wav" (64*64) $ play arch notes
--main = putStr $ show $ map (pool !!) ms
--main = putStr $ show $ (1%2) == (2%4)

notes = map (pool !!) n
  where
    n = foldl1 (++) [ms i | i <- [17..64]]

ms n = iterate (markov n) [] !! 128

markov :: Int -> [Int] -> [Int]
markov m hs = pickfrom possibilities : hs
  where
    possibilities = [ head h | h <- ta, t == (tail h) ]
    t             = take depth hs
    ta            = [take (depth+1) h | h <- tails hs, length h > depth]
    depth         = 2
    pickfrom p    = ps !! index
      where
        h = hash hs
        index = mod h $ length ps
        ps = mod h m : p

pool = map fromRational $ sieve ns
  where
    sieve (n:xs) = n : sieve [ x|x <- xs, x /= n ]
    ns = [ n % d | d <- [1..], n <- [0..d*2] ]
