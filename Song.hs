module Song where

import Gensounds
import System.Random

rg = map (`mod` possibilities) $ rl $ next generator
  where
    rl (v,g) = v : (rl $ next g)
    generator = mkStdGen 0

song t = sin . freq $ t
  where
    freq = (2*pi*10*t*)

--main = gen "out.wav" 16.0 song
main = putStr $ show $ take 1024 $ map (note . fromIntegral) rg

note n = freq
  where
    freq = 16.0 * 2.0 ** (n / 16)

bottom = 16
top = 2 ** topexpo
topexpo = 14
resolution = 2**4
possibilities = topexpo*resolution
