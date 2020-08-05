{-# LANGUAGE FlexibleInstances #-}
module Main where


data Sum a b = First a | Second b deriving (Eq, Show)

instance Functor (Sum a ) where
  fmap _ (First a) = First a
  fmap f (Second b) = Second (f b)

data Company a b c = DeepBlue a c | Something b deriving (Eq, Show)

instance Functor (Company a b) where
  fmap _ (Something b) = Something b
  fmap f (DeepBlue a c) = DeepBlue a (f c)

data More a b = L a b a | R b a b deriving (Eq, Show)

instance Functor (More a) where
  fmap f (L a b a') = L a (f b) a'
  fmap f (R b a b') = R (f b) a (f b')


data Quant a b = Finance | Desk a | Bloor b deriving (Eq, Show)

instance Functor (Quant a) where
  fmap _ Finance = Finance
  fmap _ (Desk a) =Desk a
  fmap f (Bloor b) = Bloor (f b)

data K a b = K a deriving (Eq, Show)

instance Functor (K a) where
  fmap _ (K a) = K a


newtype Flip f a b = Flip (f b a) deriving (Eq, Show)

newtype K' a b = K' a deriving (Eq, Show)

instance Functor (Flip K' a) where
  fmap f (Flip (K' b)) = Flip (K' (f b))

data EvilGoateeConst a b = GoatyConst b deriving (Eq, Show)

instance Functor (EvilGoateeConst a) where
  fmap f (GoatyConst b) = GoatyConst (f b)
  
data LiftItOut f a = LiftItOut (f a)

instance (Functor f) =>Functor (LiftItOut f) where
  fmap f (LiftItOut fa) = LiftItOut (fmap f fa)


data Parappa f g a = DaWrappa (f a) (g a) deriving (Eq, Show)

instance (Functor f,Functor g) => Functor (Parappa f g) where
  fmap f (DaWrappa fa ga) = DaWrappa (fmap f fa) (fmap f ga) 

data IgnoreOne f g a b = IgnoringSomething (f a) (g b)

instance (Functor f, Functor g) => Functor (IgnoreOne f g a) where
  fmap f (IgnoringSomething fa gb) = IgnoringSomething fa (fmap f gb)

data Notorious g o a t = Notorious (g o) (g a) (g t) deriving (Eq, Show)

instance  (Functor g) => Functor (Notorious g o a) where
  fmap f (Notorious go ga gt) = Notorious go ga (fmap f gt)


data List a = Nil | Cons a (List a) deriving (Eq, Show)

instance Functor List where
  fmap _ Nil = Nil
  fmap f (Cons x a) = Cons (f x) (fmap f a) 

data GoatLord a = NoGoat | OneGoat a | MoreGoats (GoatLord a) (GoatLord a) (GoatLord a) deriving (Eq, Show)

instance Functor GoatLord where
  fmap _ NoGoat = NoGoat
  fmap f (OneGoat a) = OneGoat (f a)
  fmap f (MoreGoats a b c) = MoreGoats (fmap f a) (fmap f b) (fmap f c)

data TalkToMe a = Halt
                | Print String a
                | Read (String -> a)

instance Functor TalkToMe where
  fmap _ Halt = Halt
  fmap f (Print s a) = Print s (f a)
  fmap f (Read a) = Read (f . a)
main :: IO ()
main = do
  putStrLn "hello world"
