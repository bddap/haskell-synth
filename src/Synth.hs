module Synth
  ( synth
  , Time
  , Duration
  , Sample
  , module Data.WAVE
  ) where
import           Data.WAVE

type Time = Double
type Duration = Time
type Sample = Double

numChannel = 1
samplePerSecond = 16000
sampleWidth = 32

header :: Int -> WAVEHeader
header numSample = WAVEHeader numChannel (round samplePerSecond) sampleWidth (Just numSample)

samples :: (Time -> Sample) -> [[WAVESample]]
samples song = map f [0, 1..]
  where
    f = (: []) . doubleToSample . song . (/ samplePerSecond)

synth :: Duration -> (Time -> Sample) -> WAVE
synth d f = WAVE h s
  where
    h = header c
    s = take c $ samples f
    c = round $ samplePerSecond * d
