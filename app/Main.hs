module Main where

import Boom
import Boom.JSON

main :: IO ()
main = do
    boomfile <- loadBoomfile "test/fixtures/boomfile"
    print boomfile
-- main = withOptions $ \(Options cmd) -> do
--     case cmd of
--         CreateList l -> createList l
--         DisplayList l -> displayList l
--         DeleteList l -> deleteList l
