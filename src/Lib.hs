module Lib(
    someFunc
) where

import Text.Pandoc
import Text.Pandoc
import Text.Pandoc.Walk (walk)

someFunc :: IO ()
someFunc = interact (writeDoc . walk behead . readDoc)

behead :: Block -> Block
behead (Header n _ xs) | n >= 2 = Para [Emph xs]
behead x = x

readDoc :: String -> Pandoc
readDoc s = case readMarkdown def s of
    Right doc -> doc
    Left err  -> error (show err)

writeDoc :: Pandoc -> String
writeDoc doc = writeMarkdown def doc

doc :: String
doc = "*hi*"
