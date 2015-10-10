module Song where

import Gensounds
import Conglomeration
--import GensoundsUtil

--song t = sin (t*600*pi*2+(sin (t*pi*2*16))*100)

song = deetoodeetoo

main = gen "out.wav" 16.0 song
--main = putStr $ show $ fromCoefficients [1] (pi / 20)

--12341231231234123123
--11110000001111000222
