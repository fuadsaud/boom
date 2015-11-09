module Boom.List
    ( createList
    , displayList
    , deleteList ) where

import Boom.JSON

createList :: String -> IO ()
createList listName = putStrLn $ "creating " ++ listName

displayList :: String -> IO ()
displayList listName = do
    putStrLn $ "showing " ++ listName

    doIt

deleteList :: String -> IO ()
deleteList listName = putStrLn $ "deleting " ++ listName
