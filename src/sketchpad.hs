module Main where

main :: IO ()
main = putStrLn $ show $ c

a = [0.0,0.1..2.0]
b = reverse a
c = zipWith (*) a b
