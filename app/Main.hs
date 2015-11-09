module Main where

import Boom
import Boom.JSON

main :: IO ()
main = doIt
-- main = withOptions $ \(Options cmd) -> do
--     case cmd of
--         CreateList l -> createList l
--         DisplayList l -> displayList l
--         DeleteList l -> deleteList l
