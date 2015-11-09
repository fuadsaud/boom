{-# LANGUAGE LambdaCase, OverloadedStrings #-}

module Boom.JSON where

import Data.Aeson as JSON
import Data.Map (Map)
import qualified Data.ByteString.Lazy as B

data Boomfile = Boomfile (Map String List) deriving Show
newtype List = List (Map String String) deriving Show

instance JSON.FromJSON List where
    parseJSON j = List <$> parseJSON j

instance JSON.FromJSON Boomfile where
    parseJSON = \case Object o -> (o .: "lists") >>= fmap Boomfile . parseJSON

jsonFile :: FilePath
jsonFile = "test/fixtures/Boomfile"

getJSON :: IO B.ByteString
getJSON = B.readFile jsonFile

doIt :: IO ()
doIt = do
    str <- getJSON
    print str
    print (decode str :: Maybe Boomfile)
