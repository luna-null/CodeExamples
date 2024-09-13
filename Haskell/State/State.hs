module State where

import Control.Monad -- you will need to put this towards the top of the file
import System.Random
import Control.Applicative

data TurnstileState = Locked | Unlocked
  deriving (Eq, Show)

data TurnstileOutput = Thank | Open | Tut
  deriving (Eq, Show)

coin, push :: TurnstileState -> (TurnstileOutput, TurnstileState)
coin _ = (Thank, Unlocked)
push Locked = (Tut, Locked)
push Unlocked = (Open, Locked)

monday :: TurnstileState -> ([TurnstileOutput], TurnstileState)
monday s0 =
  let (a1, s1) = coin s0
      (a2, s2) = push s1
      (a3, s3) = push s2
      (a4, s4) = coin s3
      (a5, s5) = push s4
   in ([a1, a2, a3, a4, a5], s5)

regularPerson, distractedPerson, hastyPerson :: TurnstileState -> ([TurnstileOutput], TurnstileState)
regularPerson s0 =
  let (a1, s1) = coin s0
      (a2, s2) = push s1
   in ([a1, a2], s2)
distractedPerson s0 =
  let (a1, s1) = coin s0
   in ([a1], s1)
hastyPerson s0 =
  let (a1, s1) = push s0
   in if a1 == Open
        then ([a1], s1)
        else
          let (a2, s2) = coin s1
              (a3, s3) = push s2
           in ([a1, a2, a3], s3)

tuesday :: TurnstileState -> ([TurnstileOutput], TurnstileState)
tuesday s0 =
  let (a1, s1) = regularPerson s0
      (a2, s2) = hastyPerson s1
      (a3, s3) = distractedPerson s2
      (a4, s4) = hastyPerson s3
   in (a1 ++ a2 ++ a3 ++ a4, s4)

luckyPair :: Bool -> TurnstileState -> (Bool, TurnstileState)
luckyPair firstIsDistracted s0 =
  let (_, s1) = if firstIsDistracted then distractedPerson s0 else regularPerson s0
      (a2, s2) = push s1
   in (a2 == Open, s2)

newtype State s a = State {runState :: s -> (a, s)}

state :: (s -> (a, s)) -> State s a
state = State

instance Functor (State s) where
  fmap :: (a -> b) -> (State s) a -> (State s) b
  -- fmap f (State p) =
  --   let p' = \s0 -> let (a, s1) = p s0
  --                   in  (f a, s1)
  --   in state p'
  -- fmap f (State p) = state $ \s0 -> let (a, s1) = p s0 in (f a, s1)
  -- fmap f sp = state $ \s0 -> let (a, s1) = runState sp s0 in (f a, s1)
  fmap f sp = state $ first f . runState sp where first f (x, y) = (f x, y)


instance Applicative (State s) where
  pure :: a -> State s a
  pure x = State (\s -> (x, s))
  (<*>) :: State s (a -> b) -> State s a -> State s b
  State pf <*> State px =
    state $ \s0 -> let (f, s1) = pf s0
                       (x, s2) = px s1
                   in (f x, s2)

instance Monad (State s) where
  return :: a -> State s a
  return x = State (\s -> (x, s))
  (>>=) :: State s a -> (a -> State s b) -> State s b
  --
  p >>= k = q
   where
    p' = runState p -- p' :: s -> (a, s)
    k' = runState . k -- k' :: a -> s -> (b, s)
    q' s0 = (y, s2) -- q' :: s -> (b, s)
     where
      (x, s1) = p' s0 -- (x, s1) :: (a, s)
      (y, s2) = k' x s1 -- (y, s2) :: (b, s)
    q = state q'

--
-- same thing as:
--  p >>= k = state $ \ s0 ->
--  let (x, s1) = runState p s0 -- Running the first processor on s0.
--  in runState (k x) s1        -- Running the second processor on s1.

compose ::
  (s -> (a, s)) -> -- first function
  (a -> (s -> (b, s))) -> -- second function, note type is similar to (a,s) -> (b,s)
  s ->
  (b, s) -- composed function
compose f g = \s0 -> let (a1, s1) = f s0 in (g a1) s1



coinS, pushS :: State TurnstileState TurnstileOutput

-- coinS = State coin

coinS = do
  put Unlocked
  return Thank


-- pushS = State push
--
-- pushS = state $ \s -> case s of
--   Locked -> (Tut, Locked)
--   Unlocked -> (Open, Locked)

pushS = do
  s <- get
  put Locked
  case s of
    Locked    -> return Tut
    Unlocked  -> return Open



mondayS :: State TurnstileState [TurnstileOutput]
-- mondayS = do
--   a1 <- coinS
--   a2 <- pushS
--   a3 <- pushS
--   a4 <- coinS
--   a5 <- pushS
--   return [a1, a2, a3, a4, a5]
mondayS = sequence [coinS, pushS, pushS, coinS, pushS]

regularPersonS, distractedPersonS, hastyPersonS :: State TurnstileState [TurnstileOutput]

-- regularPersonS = sequence [coinS, pushS]
regularPersonS = mapM turnS [Coin, Push]

-- distractedPersonS = sequence [coinS]
distractedPersonS = mapM turnS [Coin]

hastyPersonS = do
  a1 <- pushS
  if a1 == Open
    then return [a1]
    else do
      ax <- mapM turnS [Coin, Push]
      return (a1:ax)



luckyPairS :: Bool -> State TurnstileState Bool
luckyPairS firstIsDistracted = do
  if firstIsDistracted then distractedPersonS else regularPersonS   -- We don't care about the return value, so don't bind it.
  a2 <- pushS
  return (a2 == Open)

evalState :: State s a -> s -> a
evalState p s = fst (runState p s)

execState :: State s a -> s -> s
execState p s = snd (runState p s)

testTurnstile :: State TurnstileState Bool
testTurnstile = do
--   -- somehow set state to Locked
--   check1 <- pushS
--   -- somehow set state to Unlocked
--   check2 <- pushS
--   -- somehow set state to Locked again
--   return (check1 == Tut && check2 == Open)

  s0 <- get
  put Locked
  check1 <- pushS
  put Unlocked
  check2 <- pushS

  put Locked
  check3 <- get
  put Unlocked
  coinS
  check4 <- get
  put s0
  return (check1 == Tut && check2 == Open && check3 == Unlocked && check4 == Unlocked)

put :: s -> State s ()
put newState = state $ \_ -> ((), newState)

get :: State s s
get = state $ \s -> (s, s)

modify :: (s -> s) -> State s ()

-- modify f = state $ \ st -> ((), f st)

-- modify f = do 
--   st <- get; put (f st)

-- modify f = get >>= \ st -> put (f st)

modify f = get >>= put . f


gets :: (s -> a) -> State s a

  -- gets f = state $ \ st -> (f st, st)

  -- gets f = do
  --   st <- get; put (f st)

  -- gets f = get >>= \ st -> return (f st)

  -- gets f = get >>= return . f

gets f = fmap f get



data TurnstileInput = Coin | Push
  deriving (Eq, Show)

turnS :: TurnstileInput -> State TurnstileState TurnstileOutput
turnS = state . turn where
  turn Coin _         = (Thank, Unlocked)
  turn Push Unlocked  = (Open, Locked)
  turn Push Locked    = (Tut, Locked)

getsThroughS :: TurnstileInput -> State TurnstileState Bool
getsThroughS input = do
  output <- turnS input
  return $ output == Open

countOpens :: [TurnstileInput] -> State TurnstileState Int
countOpens = foldM incIfOpens 0 where
  incIfOpens :: Int -> TurnstileInput -> State TurnstileState Int
  incIfOpens n i = do
    g <- getsThroughS i
    if g then return (n+1) else return n


tuesdayS :: State TurnstileState [TurnstileOutput]
-- tuesdayS = mapM turnS [Coin, Push, Push, Coin, Push]
-- tuesdayS = do
--   ax <- sequence [regularPersonS, hastyPersonS, distractedPersonS, hastyPersonS]
--   return (concat ax)
tuesdayS = concat <$> sequence [regularPersonS, hastyPersonS, distractedPersonS, hastyPersonS]


isThankedS :: TurnstileInput -> State TurnstileState Bool
isThankedS input = do
  output <- turnS input
  return $ output == Thank

saveCoinsS :: [TurnstileInput] -> State TurnstileState Int
saveCoinsS inputs = do
  (_, n) <- foldM maybeTurn (Nothing, 0) inputs
  return n
  where
  maybeTurn (Just Thank, n) Coin = return (Just Thank, n+1)
  maybeTurn (_,          n) i = do o <- turnS i; return (Just o, n)
-- saveCoinsS = fmap snd . foldM maybeTurn
--   where
--   maybeTurn (_,          n) i    = (\o -> (Just o, n)) <$> turnS i

sequenceUntil :: Monad m => (a -> Bool) -> [m a] -> m [a]
sequenceUntil f [] = return []
-- sequenceUntil f (k:kx) = do
--   a <- k
--   if f a
--     then return [a]
--     else do
--       ax <- sequenceUntil f kx
--       return (a:ax)
sequenceUntil f (k:kx) = do
  a <- k
  if f a
    then return [a]
    else (a:) <$> sequenceUntil f kx


-- Pseudo-Random State

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
-- rollDieS = state $ randomR (1,6)
rollDieS = do s0 <- get
              let (value, s1) = randomR (1,6) s0
              put s1
              return value

rollPairS :: State StdGen (Int, Int)
-- rollPairS = do
--   r1 <- rollDieS
--   r2 <- rollDieS
--   return (r1, r2)

rollPairS = liftA2 (,) rollDieS rollDieS
-- rollPairS = (:) <$> rollDieS <*> rollDieS


rollSixS :: State StdGen [Int]
rollSixS = do
  r1 <- rollDieS
  r2 <- rollDieS
  r3 <- rollDieS
  r4 <- rollDieS
  r5 <- rollDieS
  r6 <- rollDieS
  return [r1,r2,r3,r4,r5,r6]

-- Uncertain how to fix - Attempt at abstracting rolling Dice
-- rollSixS = do
--   s1 <- rollDie_ where
--     rollDie_ [] = []
--     rollDie_ (k:ks) = do
--       a <- rollDieS k
--       return $ a:(rollDie_ ks)
--   return s1

rollNS :: Int -> State StdGen [Int]
rollNS n = replicateM n rollDieS

luckyDoubleS :: State StdGen Int
-- luckyDoubleS = do
--   r1 <- rollDieS
--   if r1 == 6
--     then do
--       r2 <- rollDieS
--       return (r1+r2)
--     else
--       return r1
luckyDoubleS = do
  r1 <- rollDieS
  if r1 == 6 then fmap (+r1) rollDieS else return r1

rollDieDoubledS :: State StdGen Int
rollDieDoubledS = fmap (*2) rollDieS

rollTwoSummedS :: State StdGen Int
-- rollTwoSummedS = (+) <$> rollDieS <*> rollDieS

rollTwoSummedS = liftA2 (+) rollDieS rollDieS

happyDoubleS :: State StdGen Int
-- happyDoubleS = do
--   r1 <- rollDieS
--   r2 <- rollDieS
--   if r1 == 6
--     then return $ (r1*2) + r2
--     else return $ r1 + r2

happyDoubleS = liftA2 happy rollDieS rollDieS
  where happy a b = if a == 6 then 2 * (a + b) else a + b

getRandomS :: Random a => State StdGen a
getRandomS = state random

someTypes :: State StdGen (Int, Float, Char)
someTypes = liftA3 (,,) getRandomS getRandomS getRandomS

allTypes :: State StdGen (Int, Float, Char, Integer, Double, Bool, Integer)
allTypes = (,,,,,,) <$> getRandomS
                    <*> getRandomS
                    <*> getRandomS
                    <*> getRandomS
                    <*> getRandomS
                    <*> getRandomS
                    <*> getRandomS

randomElt :: [a] -> State StdGen a
-- randomElt sx = do 
--   s0 <- get
--   let (n, s1) = randomR (0, length sx - 1) s0
--   put s1
--   return $ sx !! n

randomElt sx = do
  n <- state $ randomR (0, length sx - 1)
  return $ sx !! n

getRandomPair :: IO (Int, Int)
getRandomPair = do
  s <- newStdGen
  return $ evalState rollPairS s

randomInputS :: State StdGen TurnstileInput
randomInputS = do
  b <- getRandomS
  return $ if b then Coin else Push

randomTurnS :: State (StdGen, TurnstileState) TurnstileOutput
-- randomTurnS = do
--   (g,t) <- get
--   let (i,g') = runState randomInputS g
--       (o,t') = runState (turnS i) t
--   put (g',t')
--   return o
randomTurnS = do
  i <- processingFst randomInputS
  processingSnd $ turnS i


processingFst :: State a o -> State (a,b) o
processingFst m = do
  (s1,s2) <- get
  let (o,s1') = runState m s1
  put (s1',s2)
  return o

processingSnd :: State b o -> State (a,b) o
processingSnd m = do
  (s1,s2) <- get
  let (o,s2') = runState m s2
  put (s1,s2')
  return o

data Lens cmb sub = Lens
  {
    view :: cmb -> sub,
    set  :: cmb -> sub -> cmb
  }

fstL :: Lens (a,b) a
fstL = Lens fst (\(_,y) x -> (x,y))

sndL :: Lens (a,b) b
sndL = Lens snd (\(x,_) y -> (x,y))

processing :: Lens cmb sub -> State sub o -> State cmb o
processing l m = do
  cmb <- get
  let sub = view l cmb
      (o,sub') = runState m sub
      cmb' = set l cmb sub'
  put cmb'
  return o
