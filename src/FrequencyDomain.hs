module FrequencyDomain
    ( toTimeDomain
    ) where

import           Synth

-- Spectrum represents and linearly spaced range of amplitudes. The first
-- element represents amplitude at 20 Hz. The last element represents amplitude
-- at 20000 Hz.
type Spectrum = [Double]

toTimeDomain :: Spectrum -> (Time -> Sample)
toTimeDomain sp = sound
  where
    sound t = sum $ map ($ t) as
    as = zipWith sine fs sp
    fs = linspace (length sp) (20, 20000)

sine f a t = a * sin (t * f * pi * 2)

linspace n (b, e) = map f [0.. n - 1]
  where
    f i = (fromIntegral i) / (fromIntegral (n - 1)) * (e - b) + b
