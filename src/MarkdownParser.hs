module MarkdownParser where

import Text.Pandoc
import Text.Pandoc.Walk (walk)

example :: IO()
example = interact (writeDoc . walk behead . parseMarkdown)

-- Examples
behead :: Block -> Block
behead (Header n _ xs) | n >= 2 = Para [Emph xs]
behead x = x

parseMarkdown :: String -> Pandoc
parseMarkdown s = case readMarkdown def s of
    Right doc -> doc
    Left err  -> error (show err)

writeDoc :: Pandoc -> String
writeDoc doc = writeMarkdown def doc

doc :: String
doc = "*hi*"
