module Song where

import Gensounds

song t = ((warble + 1) / 2 *) . sin . (*pi) . (*500) $ t
  where
    warble = sin . (/ 4) . (*pi) . (+ warblewarble) $ t
    warblewarble = sin (t * pi) * 32

main = gen "song.wav" 128 song
