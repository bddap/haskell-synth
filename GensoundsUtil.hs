
module GensoundsUtil where

import Data.Fixed (mod')

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

attack b e f t = if not afterb then 0 else go
  where
    afterb = t > b
    beforee = t < e
    go = if beforee then mute else f t
    mute = ((t - b) * slope *) . f $ t
    slope = 1 / (e - b)

sustain b e f t = if aftere then 0 else go
  where
    afterb = t > b
    aftere = t > e
    go = if afterb then mute else f t
    mute = f t * ((t-e)*slope)
    slope = 1 / (b - e)
