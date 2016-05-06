module Boom.List
    ( createList
    , displayList
    , deleteList ) where

import qualified Data.Text as T (pack, unpack, strip)
import qualified Data.Map as M (lookup, foldlWithKey)
import Boom.JSON

boomfilePath :: FilePath
boomfilePath = "test/fixtures/boomfile"

createList :: String -> IO ()
createList listName = putStrLn $ "creating " ++ listName

displayList :: String -> IO ()
displayList listName = do
    (Boomfile lists) <- loadBoomfile boomfilePath

    case M.lookup listName lists of
      Nothing          -> putStrLn $ "Can't find list called " ++ listName
      Just (List list) -> putStrLn . strip . M.foldlWithKey buildBuffer "" $ list

deleteList :: String -> IO ()
deleteList listName = putStrLn $ "deleting " ++ listName

buildBuffer :: String -> String -> String -> String
buildBuffer buffer k v = buffer ++ k ++ ": " ++ v ++ "\n"

strip :: String -> String
strip = T.unpack . T.strip . T.pack
