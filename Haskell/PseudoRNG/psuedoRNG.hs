import System.Random
import Control.Monad

rollPair :: StdGen -> ((Int, Int), StdGen)
rollPair s0 =
  let (r1, s1) = randomR (1,6) s0
      (r2, s2) = randomR (1,6) s1
  in ((r1, r2), s2)

rollSix :: StdGen -> ([Int], StdGen)
rollSix s0 =
  let (r1, s1) = randomR (1,6) s0
      (r2, s2) = randomR (1,6) s1
      (r3, s3) = randomR (1,6) s2
      (r4, s4) = randomR (1,6) s3
      (r5, s5) = randomR (1,6) s4
      (r6, s6) = randomR (1,6) s5
  in ([r1,r2,r3,r4,r5,r6], s6)

rollN :: Int -> StdGen -> ([Int], StdGen)
rollN n s0 =
  let xs = take n $ iterate (randomR (1,6) . snd) (randomR (1,6) s0)
  in (map fst xs, snd $ last xs)

rollDieS :: State StdGen Int
rollDieS = state $ randomR (1,6)

rollPairS :: State StdGen (Int, Int)
rollPairS = do
  r1 <- rollDieS
  r2 <- rollDieS
  return (r1, r2)
