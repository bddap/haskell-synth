module Song where

import Gensounds
import GensoundsUtil

len = fromIntegral . length

fof n = 2**((fromIntegral . floor) n / 12)*440

both f g x = f x + g x
allof fs x = sum $ map ($x) fs

song t = (ramp 0 0 1 1 t *) . sine . (*600) $ t

{--
song t = (*mutes) . sine . (*freq) $ t
  where
    freq = fof t
    mutes = foldl1 (*) $ map mute $ take 4 [1..]
    mute n = (ramp (0.9+n) (1+n) (1+n) (0+n) t) * (ramp (1.0+n) (0+n) (0.1+n) (1+n) t)
--}

--main = gen "out.wav" 16.0 song

main = putStr $ show 
