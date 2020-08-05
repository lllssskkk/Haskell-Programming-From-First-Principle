{-# LANGUAGE CPP #-}
{-# LANGUAGE NoRebindableSyntax #-}
{-# OPTIONS_GHC -fno-warn-missing-import-lists #-}
module Paths_chapterExercises (
    version,
    getBinDir, getLibDir, getDynLibDir, getDataDir, getLibexecDir,
    getDataFileName, getSysconfDir
  ) where

import qualified Control.Exception as Exception
import Data.Version (Version(..))
import System.Environment (getEnv)
import Prelude

#if defined(VERSION_base)

#if MIN_VERSION_base(4,0,0)
catchIO :: IO a -> (Exception.IOException -> IO a) -> IO a
#else
catchIO :: IO a -> (Exception.Exception -> IO a) -> IO a
#endif

#else
catchIO :: IO a -> (Exception.IOException -> IO a) -> IO a
#endif
catchIO = Exception.catch

version :: Version
version = Version [0,1,0,0] []
bindir, libdir, dynlibdir, datadir, libexecdir, sysconfdir :: FilePath

bindir     = "/home/chmnpanda/Desktop/code/Haskell-Programming-From-First-Principle/chapter16/chapterExercises/.stack-work/install/x86_64-linux-tinfo6/9e448857452f310c3bf7e633a3607c485473c7384f728e736cef991d20a296a0/8.8.3/bin"
libdir     = "/home/chmnpanda/Desktop/code/Haskell-Programming-From-First-Principle/chapter16/chapterExercises/.stack-work/install/x86_64-linux-tinfo6/9e448857452f310c3bf7e633a3607c485473c7384f728e736cef991d20a296a0/8.8.3/lib/x86_64-linux-ghc-8.8.3/chapterExercises-0.1.0.0-Bq6ucfZqa1yC9nuJHYqibh-chapterExercises"
dynlibdir  = "/home/chmnpanda/Desktop/code/Haskell-Programming-From-First-Principle/chapter16/chapterExercises/.stack-work/install/x86_64-linux-tinfo6/9e448857452f310c3bf7e633a3607c485473c7384f728e736cef991d20a296a0/8.8.3/lib/x86_64-linux-ghc-8.8.3"
datadir    = "/home/chmnpanda/Desktop/code/Haskell-Programming-From-First-Principle/chapter16/chapterExercises/.stack-work/install/x86_64-linux-tinfo6/9e448857452f310c3bf7e633a3607c485473c7384f728e736cef991d20a296a0/8.8.3/share/x86_64-linux-ghc-8.8.3/chapterExercises-0.1.0.0"
libexecdir = "/home/chmnpanda/Desktop/code/Haskell-Programming-From-First-Principle/chapter16/chapterExercises/.stack-work/install/x86_64-linux-tinfo6/9e448857452f310c3bf7e633a3607c485473c7384f728e736cef991d20a296a0/8.8.3/libexec/x86_64-linux-ghc-8.8.3/chapterExercises-0.1.0.0"
sysconfdir = "/home/chmnpanda/Desktop/code/Haskell-Programming-From-First-Principle/chapter16/chapterExercises/.stack-work/install/x86_64-linux-tinfo6/9e448857452f310c3bf7e633a3607c485473c7384f728e736cef991d20a296a0/8.8.3/etc"

getBinDir, getLibDir, getDynLibDir, getDataDir, getLibexecDir, getSysconfDir :: IO FilePath
getBinDir = catchIO (getEnv "chapterExercises_bindir") (\_ -> return bindir)
getLibDir = catchIO (getEnv "chapterExercises_libdir") (\_ -> return libdir)
getDynLibDir = catchIO (getEnv "chapterExercises_dynlibdir") (\_ -> return dynlibdir)
getDataDir = catchIO (getEnv "chapterExercises_datadir") (\_ -> return datadir)
getLibexecDir = catchIO (getEnv "chapterExercises_libexecdir") (\_ -> return libexecdir)
getSysconfDir = catchIO (getEnv "chapterExercises_sysconfdir") (\_ -> return sysconfdir)

getDataFileName :: FilePath -> IO FilePath
getDataFileName name = do
  dir <- getDataDir
  return (dir ++ "/" ++ name)