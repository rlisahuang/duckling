import System.Process
import System.Exit
import System.IO
import Data.ByteString.Lazy (ByteString)

url = "http://0.0.0.0:8000/parse"
body = "text=tomorrow at eight"

makePostRequest :: String -> String -> IO String
makePostRequest url body = do
  (_, Just hout, Just herr, _) <- createProcess (proc "curl" ["-X", "POST", "-d", body, url]){ std_out = CreatePipe, std_err = CreatePipe }
  output <- hGetContents hout
  errors <- hGetContents herr
  return output
--   case exitCode of
--     ExitSuccess -> return (Right output)
--     ExitFailure _ -> return (Left errors)

