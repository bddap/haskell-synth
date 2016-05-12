module Conglomeration(
  deetoodeetoo
)where


deetoodeetoo t = clip (-1) 1 . (pattern apat pt *) . (warble (pattern pat pt) (pattern fpat pt)) $ t
  where
    pt = t*8
    pat = [1,2,3,4,1,2,3,1,2,3,1,2,3,4,1,2,3,1,2,3]
    apat = map (+1) [1,1,1,1,0,0,0,0,0,0,1,1,1,1,0,0,0,2,2,2]
    fpat = [2**8,2**8.1]
    warble wamp f t = sin . shift . freq $ t
      where
        shift = (sin (t*pi*16) * wamp +)
        freq = (pi*2*f*)
    pattern p t = cycle p !! (floor t)
    clip mi ma x = max mi $ min ma x

wibbleywoo t = ((warble + 1) / 2 *) . sin . (*pi) . (*500) $ t
  where
    warble = sin . (/ 4) . (*pi) . (+ warblewarble) $ t
    warblewarble = sin (t * pi) * 32
