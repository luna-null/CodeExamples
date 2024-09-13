import Control.Monad  -- you will need to put this towards the top of the file

instance Functor (State s) where
  fmap = liftM

instance Applicative (State s) where
  pure = return
  (<*>) = ap

