
module Timbres
    (
      arch,
      vvvv,
      sudo
    ) where

import Data.Fixed (mod')

arch t = a
  where
    a = s * (2.0 - s) * 2 - 1
    s = mod' t 1.0 * 2

sudo t = if e then a else negate a
    where
      e = even $ floor h
      a = s * (2.0 - s)
      s = mod' h 1.0 * 2
      h = t * 2

vvvv t = a
  where
    a = min s (2.0 - s) * 2 - 1
    s = mod' t 1.0 * 2
