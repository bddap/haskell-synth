import Synth

main :: IO ()
main = putWAVEFile "sound.wav" sound

sound = synth 1 (sin . (2000 *))
