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

samples :: Time -> (Time -> Sample) -> [[WAVESample]]
samples len song = take count s
  where
    count = round $ sa * len
    s = map f [0,1..]
    f = (:[]) . doubleToSample . song . (/sa)
    sa = fromIntegral samplesPS

gen :: String -> Time -> (Time -> Sample) -> IO ()
gen filename len song = do
  putWAVEFile filename $ WAVE header (samples len song)
