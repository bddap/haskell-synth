module Gensounds(
gen
)where
import Data.WAVE
import Data.Int (Int32)

samplesPS = 16000
bitrate = 32

type Time = Double
type Sample = Double

header = WAVEHeader 1 samplesPS bitrate Nothing

clip mi ma x = max mi $ min ma x

samples :: Time -> (Time -> Sample) -> [[Int32]]
samples len song = take (round (len * (fromIntegral samplesPS))) $
          map (
            (:[]) .
            round .
            (* (2 ^ (32-1) - 66)) .
            (clip 0 1.0) .
            (+ 0.5) .
            (/ 2.0) .
            song .
            ( / (fromIntegral samplesPS)) .
            fromIntegral
          ) $
          [0,1..]

gen :: String -> Time -> (Time -> Sample) -> IO ()
gen filename len song = do
  putWAVEFile filename $ WAVE header (samples len song)
