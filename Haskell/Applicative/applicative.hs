-- class Functor f where
--   fmap :: (a -> b) -> f a -> f b
--   fmap id = id
--   fmap (g . f) = fmap g . fmap f

data Tree a = Node a [Tree a]

instance Functor Tree where
  fmap f (Node x ts) = Node (f x) (fmap  f <$> ts)

main = do 
  return 0
