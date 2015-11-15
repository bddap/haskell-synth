
module GensoundsUtil where

import Data.Fixed (mod')

import System.Random

rg = map (`mod` possibilities) $ rl $ next generator
  where
    rl (v,g) = v : (rl $ next g)
    generator = mkStdGen 0

--Base waves

sine = sin . (pi*2*)

square t = if (even . floor) t then 1 else (-1)

--Wave operations

both f g x = f x + g x

--Composite waves

toggle t = sine . (* freq) $ t
  where
    freq = (+512) . (*64) . square . (*16) $ t

ring t = (*mute) . toggle $ t
  where mute = if t `mod'` 4 < 3 then 1 else 0

pleasingtoggle t = (*mute) . toggle $ t
  where mute = (+0.5) . (*0.5) . sine $ t

beat = both f1 f2
  where
    f1 = (*0.5) . sine . (*freq)
    f2 = (*0.5) . sine . (*freq) . (*1.01)
    freq = 512

--note modifiers

ramp st sa et ea t = if t > st && t < et then 1 else ramp
  where
    ramp = (t - st) * slope + sa
    rise = ea - sa
    run = et - st
    slope = rise / run
