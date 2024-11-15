import System.Random
import Control.Monad
import System.Exit
-- data GuessingGame = GuessingGame
--   {
--     value     :: Integer
--   , tries     :: Integer
--   } deriving (Show)

guessTest :: Integer -> IO Ordering
guessTest val = do
  g <- getLine
  let guess = read g :: Integer
  return $ compare guess val

main = do
  let maxTries = 10
  putStrLn "Input Max number: "
  m <- getLine
  let max = read m :: Integer

  val <- randomRIO (1, max)
  -- print val
  result <- forM [1..maxTries] $ \_ -> do
    putStrLn "Enter guess: "
    test <- guessTest val
    case test of
      LT -> putStrLn "Guess is Low!" >> return False
      GT -> putStrLn "Guess is High!" >> return False
      EQ -> putStrLn "Guess is Correct! You Win!" >> return True >> exitSuccess
  
  when (not $ or result) $ putStrLn "You Lose! Max number of tries reached!"
  exitFailure
