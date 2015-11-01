module Main where

import Boom

main :: IO ()
main = withOptions $ \(Options app cmd) -> do
    case cmd of
        CreateList l -> putStrLn l
        ShowList l -> putStrLn l
        DeleteList l -> putStrLn l
