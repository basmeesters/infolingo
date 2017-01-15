module Lib where

import Text.Pandoc
import Text.Pandoc.Walk (walk)
import Text.Pandoc.Writers.HTML
import Text.Blaze.Html

someFunc :: IO ()
someFunc = print "Hello"

-- Prototype start parsing
fileContent :: FilePath -> IO String
fileContent source = readFile source

parseContent :: String -> Pandoc
parseContent s = case readMarkdown def s of
    Right doc -> doc
    Left err  -> error (show err)

createHtml :: Pandoc -> IO String
createHtml p = do
  opts <- getHtmlOpts
  return $ writeHtmlString opts p

htmlFromFile :: FilePath -> IO String
htmlFromFile source = do
    content <- fileContent source
    let pandoc = parseContent content
    createHtml pandoc

generateHtml :: FilePath -> IO()
generateHtml source = do
  htmlString <- htmlFromFile source
  writeFile "test/test.html" htmlString

getHtmlOpts = do
    template <- either (error . show) id
        `fmap` getDefaultTemplate Nothing "html"
    return $ def
        { writerStandalone = True
        , writerTemplate = template
        , writerVariables = [
            ("css", "example.css")]
            -- ("header-includes",
            --  "<style>p { background-color: magenta; }</style>")]
        }
