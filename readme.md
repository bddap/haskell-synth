# Haskell synth

## Use

```haskell
module Main where

import Synth

main :: IO ()
main = putWAVEFile "sound.wav" sound

sound = synth 1 (sin . (2000 *))
```

## Test

```bash
cabal sandbox init && \
cabal install && \
cabal build && \
cabal run && \
afplay sound.wav
```

This package re-exports Data.WAVE for convenience. Data.WAVE exports `putWAVEFile`.

## Todo

- [ ] Investigate [Wavy](https://hackage.haskell.org/package/wavy-0.1.0.0/docs/Sound-Wav.html)
- [x] Accept frequency domain as input
