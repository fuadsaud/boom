module Boom where

import Boom.List
import Boom.Options

run :: IO ()
run = withOptions $ \(Options cmd) -> do
    case cmd of
        CreateList l -> createList l
        DisplayList l -> displayList l
        DeleteList l -> deleteList l
