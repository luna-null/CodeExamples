selectionSort :: (Ord a) => [a] -> [a]
selectionSort [] = []
selectionSort [x] = [x]
selectionSort (x:[y]) = (min x y) : [max x y]

-- repeat' :: Show a => [a] -> IO ()
-- repeat' [] = return ()  -- base case for empty list
-- repeat' (x:xs) = do
--   print x
--   repeat' xs

repeat' :: Show a => [a] -> IO ()
repeat' [] = return ()  -- base case for empty list
repeat' (x:xs) = do
  print x
  repeat' xs

-- [1,3,5,2,1]
-- \ 1 [3,5,2,1] -> 3 \ 1 [5,2,1] -> 5 \ 1 [2,1] -> 2 \ 1 [1] -> 1 \ 1 [] -> 1
-- \ 3 [5,2,1] -> 5 \ 3 [2,1] -> 3 \ 2 [1] -> 2 \ 1 [] -> 1
-- \ 5 [3,2] -> 5 \ 3 [2] -> 3 \ 2 [] -> 2
-- \ 5 [3] -> 5 \ 3 [] -> 3
-- \ 5 [] -> 5


main = do
  let a = repeat' [1,7,4,4,6]
  print a
