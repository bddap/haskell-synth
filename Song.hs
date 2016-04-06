module Song where

import Gensounds
import GensoundsUtil
import Timbres

import Data.List (genericLength)
import Data.Fixed (mod')
import Control.Applicative

notes = a <$> ns <*> ds
  where
    ns = [3,4,6,2]
    ds = ns
    a n d = n / 300.0 / d

rn = r random_normals
  where
    r (h:t) = notes !! i : r t
      where
        i = floor $ genericLength notes * h

timbre = sudo

play notes t = timbre (t / n) * a
  where
    a = min s (2.0 - s)
    s = (*2) $ mod' p 1.0
    n = notes !! (floor p)
    p = t ** 0.5 * 64

songlen = (2^8)

song = play rn

main = gen "song.wav" songlen song
--main = putStr $ show $ notes
