module Boom.Options
    ( Options (..)
    , Command (..)
    , withOptions
    ) where

import Options.Applicative

type List = String
type Key = String
type Value = String

data Options = Options Command
data Command
        = All
        | Edit
        | CreateList List
        | DisplayList List
        | DeleteList List

withOptions :: (Options -> IO ()) -> IO ()
withOptions f = f =<< execParser
    (parseOptions `withInfo` "SNIPPETS MOTHERFUCKER")

withInfo :: Parser a -> String -> ParserInfo a
withInfo opts desc = info (helper <*> opts) $ progDesc desc

parseOptions :: Parser Options
parseOptions = Options <$> parseCommand

parseCommand :: Parser Command
parseCommand = subparser $
    command "create" (parseCreateList `withInfo` "create a new list") <>
    command "show" (parseDisplayList `withInfo` "show items in a list") <>
    command "delete" (parseDeleteList `withInfo` "delete a list")

parseCreateList :: Parser Command
parseCreateList = CreateList
    <$> argument str (metavar "LISTNAME")

parseDisplayList :: Parser Command
parseDisplayList = DisplayList
    <$> argument str (metavar "LISTNAME")

parseDeleteList :: Parser Command
parseDeleteList = DeleteList
    <$> argument str (metavar "LISTNAME")
