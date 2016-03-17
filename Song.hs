module Song where

import Gensounds

import GensoundsUtil
import Data.List
import Data.Fixed (mod')

middle_note = 1 / 300

manage seed ratio = n
  where
    n       = if to_high then 1 / r else r
    r       = if ratio > 1 then ratio else 1 / ratio
    to_high = seed > middle_note

--jazz :: [Double] -> Double -> [Double]
jazz rando seed = n : rest
  where
    (r0:r1:r3:rs) = rando
    f             = pick [3.0,4.0,5.0]
    n             = seed * m
    m             = manage seed ratio
    ratio         = (f r0) / (f r1)
    rest          = jazz rs n

pick ls r = ls !! index
  where
    len   = fromIntegral $ length ls - 1
    index = round $ r * len

notes = jazz random_normals b
  where
    b = middle_note
    t = fromIntegral . (+1) . (`mod` 2)

walk s t = (*a) . sine . (*f) $ t
  where
    f  = 1 / wl
    wl = notes !! (round (t*s))
    a  = 1

song t = h a t + h b t
  where
    a = walk 3
    b = walk 4
    h f = (*0.5) . f

main = gen "song.wav" 64 song
--main = putStr $ show $ (1-) $ mod' (0.4) 1
