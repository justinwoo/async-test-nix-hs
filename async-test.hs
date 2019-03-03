module Main where

import qualified System.Process as Proc
import qualified UnliftIO.Async as Async

main :: IO ()
main = do
  _ <- Async.pooledMapConcurrentlyN 10 job [1..100]
  pure ()
  where
    job x = Proc.callCommand $ "sleep 1; echo " <> show x
