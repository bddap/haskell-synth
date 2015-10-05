module Song where

import Gensounds
import GensoundsUtil (sine)

type Frequency = Double
type Power = Double
type DiscreteWave = (Frequency, Power)
type Timbre = [DiscreteWave]
type Time = Double
type Sample = Double

square :: Timbre
square = zip pows freqs
  where
    freqs = map (2**) base
    pows = map ((1/) . (2**)) base
    base = take 5 [1,2..]

play :: Timbre -> Time -> Sample
play s t = sum $ map sample s
  where
    sample (p, f) = (p/total*) . sine . (*f) $ t
    total = sum $ map pow s
    len = fromIntegral $ length s
    pow (p, _) = p

doot f = play square . (*f)

song t = doot (sine t * 64) t

main = gen "out.wav" 16.0 song
