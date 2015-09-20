module Sound where
import Data.WAVE
import Data.Int (Int32)
import Song

samplesPS = 16000
bitrate = 32
maxInt = 2 ^ (32-1) - 1

header = WAVEHeader 1 samplesPS bitrate Nothing

samples :: [[Int32]]
samples = take (round (songlen * (fromIntegral samplesPS))) $
          map (
            (:[]) .
            round .
            (* maxInt) .
            songfunc
          ) $
          [0.0, 1.0 / (fromIntegral samplesPS)..]

waveData = WAVE header samples

makeWavFile :: WAVE -> IO ()
makeWavFile wav = putWAVEFile "temp.wav" wav

main = makeWavFile waveData
