module FileHandling where

import System.Directory
import System.FilePath.Posix

fileContent :: FilePath -> IO String
fileContent source = readFile source
