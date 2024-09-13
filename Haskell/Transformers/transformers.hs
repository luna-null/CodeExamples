-- Robots in the sky
import Control.Monad
import Control.Monad.Trans
import Control.Applicative


-- getPassphrase :: IO (Maybe String)
-- getPassphrase = do s <- getLine
--                    if isValid s then return $ Just s
--                                 else return Nothing
getPassphrase :: MaybeT IO String
getPassphrase = do s <- lift getLine
                   guard (isValid s) -- Alternative provides guard.
                   return s

-- The validation test could be anything we want it to be.
isValid :: String -> Bool
isValid s = length s >= 8
            && any isAlpha s
            && any isNumber s
            && any isPunctuation s
            where
              isAlpha, isNumber, isPunctuation :: Char -> Bool
              isAlpha a = a `elem` ['a'..'z'] ++ ['A'..'Z']
              isNumber a = a `elem` "1234567890"
              isPunctuation a = a `elem` "`~,.<>/?\\[]{};:-=!@#$%^&*()_+"

-- askPassphrase :: IO ()
-- askPassphrase = do putStrLn "Insert your new passphrase: "
--                    maybe_value <- getPassphrase
--                    case maybe_value of
--                        Just value -> do putStrLn "Storing in database..." -- do stuff
--                        Nothing    -> putStrLn "Passphrase invalid."
askPassphrase :: MaybeT IO ()
askPassphrase = do lift $ putStrLn "Insert your new passphrase: "
                   value <- getPassphrase
                   lift $ putStrLn "Storing in database..."

newtype MaybeT m a = MaybeT { runMaybeT :: m (Maybe a) }

instance Monad m => Monad (MaybeT m) where
  return  = MaybeT . return . Just

  -- The signature of (>>=), specialized to MaybeT m:
  -- (>>=) :: MaybeT m a -> (a -> MaybeT m b) -> MaybeT m b
  x >>= f = MaybeT $ do maybe_value <- runMaybeT x
                        case maybe_value of
                          Nothing    -> return Nothing
                          Just value -> runMaybeT $ f value
  -- (>>=) for the Maybe monad

instance Monad m => Applicative (MaybeT m) where
  pure = return
  (<*>) = ap

instance Monad m => Functor (MaybeT m) where
  fmap = liftM

instance Monad m => Alternative (MaybeT m) where
  empty   = MaybeT $ return Nothing
  x <|> y = MaybeT $ do maybe_value <- runMaybeT x
                        case maybe_value of
                          Nothing       -> runMaybeT y
                          Just _        -> return maybe_value

instance Monad m => MonadPlus (MaybeT m) where
  mzero = empty
  mplus = (<|>)

-- instance MonadTrans MaybeT where
--   lift = MaybeT . liftM Just

instance MonadTrans MaybeT where
  lift m = MaybeT (fmap Just m)

newtype StateT s m a = StateT { runStateT :: s -> m (a,s) }

instance (Monad m) => Monad (StateT s m) where
  return a         = StateT $ \s -> return (a,s)
  (StateT x) >>= f = StateT $ \s -> do
    (v,s') <- x s       -- get new value and state
    runStateT (f v) s'  -- pass them to f

instance (Monad m) => MonadState s (StateT s m) where
  get   = StateT $ \s -> return (s,s)
  put s = StateT $ \_ -> return ((),s)

instance (MonadPlus m) => MonadPlus (StateT s m) where
  mzero = StateT $ \_ -> mzero
  (StateT x1) `mplus` (StateT x2) = StateT $ \s -> (x1 s) `mplus` (x2 s)

instance MonadTrans (StateT s) where
  lift c = StateT $ \s -> c >>= (\x -> return (x,s))

-- state :: MonadState s m => (s -> (a, s)) -> m a
-- state f = do
--   s <- get
--   let (x, s') = f s
--   put s'
--   return x

-- runMaybeT :: MaybeT m a -> m (Maybe a)
-- MaybeT (State s) a -> State s (Maybe a)

-- runStateT :: StateT s m a -> s -> m (a,s)
-- StateT s Maybe a -> s -> Maybe (a,s)
