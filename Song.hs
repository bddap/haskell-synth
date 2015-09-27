
module Song where

import Gensounds
import Data.Fixed (mod')

songlen = 8.0

pi2 song = speed (pi * 2) song

volume v song = (*v) . song

speed s f = f . (* s)

saw t = speed 600 m t
  where
    m ti = mod' ti 2.0 - 1.0

ramp t =  speed (t * 600 * pi * 2) sin t

sine = speed 600 $ pi2 sin

main = gen "out.wav" songlen sine
