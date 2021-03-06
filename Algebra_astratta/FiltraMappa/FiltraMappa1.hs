{-# LANGUAGE FlexibleInstances #-}
{-# LANGUAGE FunctionalDependencies #-}

class FilterableMappable a b | a -> b where
    test :: a -> Bool
    trans :: a -> b

filterAndMap :: FilterableMappable a b => [a] -> [b]
filterAndMap [] = []
filterAndMap (x:l) = if test x then (trans x) : filterAndMap l else filterAndMap l

instance FilterableMappable Int Int where
    test x = x >= 18
    trans x = x