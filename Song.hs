
module Song
( songfunc
, songlen
) where

import Data.Fixed (mod')

saw t = fromIntegral $ rem t 1

ramp t = sin $ t * t * 2 * 600 / songlen * pi

songlen = 5.0

songfunc = ramp
