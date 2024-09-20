sub :: (Int, Int) -> Int
sub (a,b) = b-a

handleLine :: [Int] -> [Int]
handleLine line = map sub $ createPairs line

parseLine :: String -> [Int]
parseLine str = map read $ words str

createPairs :: [Int] -> [(Int, Int)]
createPairs [] = []
createPairs [_] = []
createPairs (x:y:xs) = (x,y) : createPairs (y:xs)


main :: IO ()
main = do
  contents <- readFile "sample.txt"
  let x = map parseLine (lines contents)
  let y = map handleLine x
  print(y)

