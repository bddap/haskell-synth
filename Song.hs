module Song where

import Gensounds
import GensoundsUtil

song = (attack 1 2) . (sustain 6 7) $ pleasingtoggle
main = gen "out.wav" 8.0 song
