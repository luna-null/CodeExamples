class Applicative f => Alternative f where
  empty :: f a
  (<|>) :: f a -> f a -> f a

instance Alternative Maybe where
  empty               = Nothing
  -- Not that this could have been written more compactly.
  Nothing <|> Nothing = Nothing	-- 0 results + 0 results = 0 results
  Just x <|> Nothing  = Just x	-- 1 result + 0 results = 1 result
  Nothing <|> Just x  = Just x	-- 0 results + 1 result = 1 result
  Just x <|> Just y   = Just x
				-- Maybe can only hold up to one result,
				-- so we discard the second one.
instance Alternative [] where
  empty = []
  (<|>) = (++) -- length xs + length ys = length (xs ++ ys)

digit i (c:_)
  | i > 9 || i < 0 = Nothing
  | otherwise	     = 
    if [c] == show i then Just i else Nothing

binChar :: String -> Maybe Int
binChar s = digit 0 s <|> digit 1 s

class Monad m => MonadPlus m where
  mzero :: m a
  mplus :: m a -> m a -> m a

-- empty is a neutral element
-- empty <|> u = u
-- u <|> empty = u
-- (<|>) is associative
-- u <|> (v <|> w) = (u <|> v) <|> w

-- mzero `mplus` m = m
-- m `mplus` mzero = m
-- m `mplus` (n `mplus` o) = (m `mplus` n) `mplus` o
-- mzero >>= f = mzero -- left zero
-- m >> mzero  = mzero -- right zero

asum :: (Alternative f, Foldable t) => t (f a) -> f a
asum = foldr (<|>) empty

msum :: (MonadPlus m, Foldable t) => t (m a) -> m a
msum = foldr mplus mzero


-- Example function
-- pythags = [ (x, y, z) | z <- [1..], x <- [1..z], y <- [x..z], x^2 + y^2 == z^2 ]

pythags = do
  z <- [1..]
  x <- [1..z]
  y <- [x..z]
  guard (x^2 + y^2 == z^2)
  return (x, y, z)

-- pythags =
--   let ret x y z = [(x, y, z)]
--       gd  z x y = concatMap (\_ -> ret x y z) (guard $ x^2 + y^2 == z^2)
--       doY z x	= concatMap (gd z x) [x..z]
--       doX z	= concatMap (doY z ) [1..z]
--       doZ	= concatMap (doX   ) [1..]
--   in doZ

guard :: Alternative m => Bool -> m ()
guard True = pure ()
guard _ = empty

-- Nothing `mplus` (Just a) = Just a
-- (Just a) `mplus` Nothing = Just a
-- (Just a) `mplus` ((Just b) `mplus` (Just c)) = ((Just a) `mplus` (Just b)) `mplus` (Just c)

-- [] `mplus` [x] = [x]
-- [x] `mplus` [] = [x]
-- [x] `mplus` ([y] `mplus` [z]) = ([x] `mplus` [y]) `mplus` [z]

-- | Consume a given character in the input, and return
--   the character we just consumed, paired with rest of
--   the string. We use a do-block so that if the pattern
--   match fails at any point, 'fail' of the Maybe monad
--   (i.e. Nothing) is returned.
char :: Char -> String -> Maybe (Char, String)
char c s = do
  c' : s' <- return s
  guard (c == c')
  return (c, s')

hexChar :: Char -> String -> Maybe (Char, String)
hexChar = digitParse `mplus` alphaParse s
  where digitParse s = do let (c':s') = s
			  x <- msum $ map ($ s) (map digit [0..9])
			  return (intToDigit x, s')
			  alphaParse s = msum $ map ($ s) (map char (['a'..'f'] ++ ['A'..'F']))

-- You can also replace asum with msum and <|> with mplus
hexChar :: String -> Maybe (Char. String)
hexChar s = 
  let x = asum $ map ($ s) (map char "0123456789")
      y = asum $ map ($ s) (map char "abcdefABCDEF")
  in x <|> y

safeLog :: (Floating a, Ord a) => a -> Maybe a
safeLog x = guard (x > 0) *> pure (log x)

class Monoid m where
  mempty  :: m
  mappend :: m -> m -> m

instance Monoid [a] where
  mempty  = []
  mappend = (++)


-- Additionally suggested laws
-- (f <|> g) <*> a = (f <*> a) <|> (g <*> a) -- right distributivity (of <*>)
-- empty <*> a = empty -- right absorption (for <*>)
-- (m `mplus` n) >>= k = (m >>= k) `mplus` (n >>= k) -- left distribution
-- return x `mplus` m = return x -- left catch

-- -- for any x, y :: m a,
-- x `mplus` y
-- = -- monad identity
-- (return x >>= id) `mplus` (return y >>= id)
-- = --left distribution
-- (return x `mplus` return y) >>= id
-- = -- left catch
-- return x >>= id
-- = -- monad identity
-- x
