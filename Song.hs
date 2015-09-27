
module Song where

import Gensounds
import Data.Fixed (mod')

songlen = 32.0

pi2 song = speed (pi * 2) song

volume v song = (*v) . song

speed s f = f . (* s)

square t = if (even . floor) t then 1 else (-1)

shift offset song = song . (+offset)

saw t = speed 600 m t
  where
    m ti = mod' ti 2.0 - 1.0

compo t = sum $ map ($ t) sines
  where
    sines = map sine coefficients
    coefficients = [600]
    sine freq = speed freq $ pi2 sin

composquared t = sample ** (speed 10 square t / 2 + 2.5) * doneg
  where
    sample = speed s compo t
    doneg = if sample < 0 then (-1) else 1
    s = mod' (fromIntegral (speed t floor t)) 4

main = gen "out.wav" songlen $ shift (-4) composquared
