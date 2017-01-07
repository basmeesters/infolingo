module MarkdownParserSpec where

import Test.Hspec
import Test.QuickCheck
import Control.Exception (evaluate)

import MarkdownParser

testMarkdownParser :: Spec
testMarkdownParser = describe "InfoLingo.MarkdownParser" $ do
  it "parses Markdown files correct" $ do
    writeDoc (parseMarkdown "*hi*") `shouldBe` "*hi*"
