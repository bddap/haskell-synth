module Song where

import Gensounds
import GensoundsUtil (sine)

len = fromIntegral . length

song t = (/(len waves)) . sum $ map ($t) waves
  where
    waves = take 10 $ map wave [1..]
    wave n = both (sine . (2**n *)) (sine . ((2**n+n)*))

both f g x = f x + g x

main = gen "out.wav" 16.0 song
