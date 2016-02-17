{-# LANGUAGE LambdaCase, OverloadedStrings #-}

module Boom.JSON where

import Data.Aeson as JSON
import Data.Map (Map)
import qualified Data.ByteString.Lazy as B

newtype Boomfile = Boomfile (Map String List) deriving Show
newtype List = List (Map String String) deriving Show

instance JSON.FromJSON List where
    parseJSON j = List <$> parseJSON j

instance JSON.FromJSON Boomfile where
    parseJSON = \case Object o -> (o .: "lists") >>= fmap Boomfile . parseJSON

getJSON :: FilePath -> IO B.ByteString
getJSON path = B.readFile path

loadBoomfile :: FilePath -> IO (Boomfile)
loadBoomfile path = do
    str <- getJSON path
    maybe (ioError (userError"JSON")) return $ decode str
