module Song where

import Gensounds
import GensoundsUtil

note n = sine . (2.0 ** n *)

play n = (attack 0 0.5) . (sustain 0.5 1) $ note n

playnotes [] = n
  where n x = 0
playnotes (x:xs) = both (play x) $ (playnotes xs) . (subtract 0.5)

vibrato freq f t = f t * mute
  where mute = sine (t * freq) * 0.5 + 0.5

song = vibrato 8 $ playnotes $ take 16 [7,7.25..]

main = gen "out.wav" 8.0 song
