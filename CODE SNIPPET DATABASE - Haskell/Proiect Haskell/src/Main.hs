module Main where

import Args
  ( AddOptions (..),
    Args (..),
    GetOptions (..),
    SearchOptions (..),
    parseArgs,
  )
import qualified Data.List as L
import qualified Entry.DB as DB
import Entry.Entry
  ( Entry (..),
    FmtEntry (FmtEntry),
    matchedByAllQueries,
    matchedByQuery,
  )
import Result
import System.Environment (getArgs)
import Test.SimpleTest.Mock
import Prelude hiding (print, putStrLn, readFile)
import qualified Prelude

usageMsg :: String
usageMsg =
  L.intercalate
    "\n"
    [ "snip - code snippet manager",
      "Usage: ",
      "snip add <filename> lang [description] [..tags]",
      "snip search [code:term] [desc:term] [tag:term] [lang:term]",
      "snip get <id>",
      "snip init"
    ]

-- | Handle the init command
handleInit :: TestableMonadIO m => m ()
handleInit = do
  DB.save DB.empty
  return ()


-- | Handle the get command
handleGet :: TestableMonadIO m => GetOptions -> m ()
handleGet getOpts = do
  database <- DB.load
  case database of 
    Success db ->
      let 
        firstEntry = DB.findFirst (\x -> entryId x == getOptId getOpts) <$> database
      in
        case firstEntry of
          Success entry -> 
            case entry of
              Just en -> putStrLn $ entrySnippet en
              _ -> putStrLn "Could not find entry"
          _ -> putStrLn "Could not find entry"
    Error err -> putStrLn "Failed to load DB"


showAll :: TestableMonadIO m => [Entry] -> m ()
showAll entryList = 
  case entryList of
    x : xs -> putStrLn (show (FmtEntry x)) >> showAll xs
    [] -> return ()

-- | Handle the search command
handleSearch :: TestableMonadIO m => SearchOptions -> m ()
handleSearch searchOpts = do
  database <- DB.load
  case database of
    Success db ->
      let 
        allEntries = DB.findAll(\x -> Entry.Entry.matchedByAllQueries (searchOptTerms searchOpts) x) <$> database
      in
        case allEntries of
          Success entries ->
            case entries of 
              [] -> putStrLn "No entries found"
              _ -> showAll entries
          _ -> putStrLn "Failed to load DB"
    Error err -> putStrLn "Failed to load DB"

-- | Handle the add command
handleAdd :: TestableMonadIO m => AddOptions -> m ()
handleAdd addOpts = do
  database <- DB.load
  case database of
    Success database -> do
      file <- readFile $ addOptFilename addOpts
      let alreadyExists = DB.findFirst (\en -> (entrySnippet en) == file) database
      case alreadyExists of
        Nothing -> do
          let id = length $ DB.findAll (\x -> True) database
          let newEntry = makeEntry id file addOpts
          let insertAction = DB.insertWith (\_ -> newEntry) database
          DB.modify (\a -> insertAction)
          return ()
        Just alreadyExists ->  putStrLn ("Entry with this content already exists: \n" ++ "[" ++ show (entryId alreadyExists) ++ "]" ++ " " ++ (entryFilename alreadyExists) ++ ":")
    Error err -> putStrLn "Failed to load DB"
  where
    makeEntry :: Int -> String -> AddOptions -> Entry
    makeEntry id snippet addOpts =
      Entry
        { entryId = id,
          entrySnippet = snippet,
          entryFilename = addOptFilename addOpts,
          entryLanguage = addOptLanguage addOpts,
          entryDescription = addOptDescription addOpts,
          entryTags = addOptTags addOpts
        }

-- | Dispatch the handler for each command
run :: TestableMonadIO m => Args -> m ()
run (Add addOpts) = handleAdd addOpts
run (Search searchOpts) = handleSearch searchOpts
run (Get getOpts) = handleGet getOpts
run Init = handleInit
run Help = putStrLn usageMsg

main :: IO ()
main = do
  args <- getArgs
  let parsed = parseArgs args
  case parsed of
    (Error err) -> Prelude.putStrLn usageMsg
    (Success args) -> run args
