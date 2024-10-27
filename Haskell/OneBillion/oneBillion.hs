import Data.Either

oneBillion :: Integer -> Integer
oneBillion n
  | n == 1000000000   = 1000000000
  | otherwise         = oneBillion (n+1)

main = do
  let x = oneBillion 1
  print x


