module Main where

import Test.Hspec
import Test.QuickCheck
import Control.Exception (evaluate)
import System.Directory

import MarkdownParserSpec
import FileHandling

main :: IO ()
main = hspec $ do
  testMarkdownParser
  fileHandlingSpec
  markdownParserSpec

fileHandlingSpec :: Spec
fileHandlingSpec =
  describe "FileHandling" $ do
    it "#fileContent gives the contents of the given file" $ do
      content <- fileContent "test/example.md"
      content `shouldBe` "Example\n=======\n"

    it "#fileContent gives an error message if the file cannot be found" True

    it "#allFileContents gives all the contents of the given directory" True

markdownParserSpec :: Spec
markdownParserSpec = describe "MarkdownParser" $ do
  it "#parseMarkdown should return a Pandoc structure after parsing" True

  it "#makeHtml should create a HTML document given a string" True
