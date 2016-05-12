module Main where

import Gensounds
import GensoundsUtil (play)
import Data.List (genericLength, tails)
import Data.Ratio ((%))
import Data.Hashable (hash,Hashable)
import Timbres (arch)

main = gen "song.wav" (512) $ play arch notes
--main = putStr $ show $ map (pool !!) ms
--main = putStr $ show $ (1%2) == (2%4)
--main = putStr . show . take 20 $ lazycat [[0..i] | i <- [1..]]

lazycat ([]:[]) = []
lazycat ([]:(xs:xss)) = lazycat (xs:xss)
lazycat ((x:xs):xss) = x : lazycat (xs:xss)

notes = map (pool !!) n
  where
    n = lazycat [ms i | i <- [1..]]

ms n = iterate (markov n) [] !! 64

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
