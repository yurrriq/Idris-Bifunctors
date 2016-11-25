module Data.Bifunctor.Wrapped

import Data.Bifunctor
import Data.Bifunctor.Apply
import Data.Biapplicative
import Data.Bifoldable
import Data.Bitraversable
import Data.Morphisms
import Data.Verified.Bifunctor

%access public export

||| Wrap a Bifunctor
|||
||| ````idris example
||| Wrap ("hello", 1)
||| ````
|||
record Wrapped (p : Type -> Type -> Type) a b where
  constructor Wrap
  unwrap : p a b

implementation Bifunctor p => Bifunctor (Wrapped p) where
  bimap f g = Wrap . bimap f g . unwrap
  -- NOTE: first and second are defined here to make the proofs easier.
  first f = Wrap . first f . unwrap
  second g = Wrap . second g . unwrap

implementation Bifunctor p => Functor (Wrapped p a) where
  map f = Wrap . second f . unwrap

implementation Biapply p => Biapply (Wrapped p) where
  (Wrap fg) <<.>> (Wrap xy) = Wrap (fg <<.>> xy)

implementation Biapplicative p => Biapplicative (Wrapped p) where
  bipure a b                = Wrap $ bipure a b
  (Wrap fg) <<*>> (Wrap xy) = Wrap $ fg <<*>> xy

implementation Bifoldable p => Bifoldable (Wrapped p) where
  bifoldMap f g = bifoldMap f g . unwrap

implementation Bifoldable p => Foldable (Wrapped p a) where
  foldr f z = bifoldr (const $ const z) f z . unwrap

implementation Bitraversable p => Bitraversable (Wrapped p) where
  bitraverse f g = map Wrap . bitraverse f g . unwrap

implementation Bitraversable p => Traversable (Wrapped p a) where
  traverse f = map Wrap . bitraverse pure f . unwrap

implementation VerifiedBifunctor p => VerifiedBifunctor (Wrapped p) where
  bifunctorIdentity (Wrap x)        = cong (bifunctorIdentity x)
  bifunctorFirstIdentity (Wrap x)   = cong (bifunctorFirstIdentity x)
  bifunctorSecondIdentity (Wrap x)  = cong (bifunctorSecondIdentity x)
  bifunctorComposition f g (Wrap x) = cong (bifunctorComposition f g x)
  bifunctorBimapComposition f g h i (Wrap x)
    = cong (bifunctorBimapComposition f g h i x)
  bifunctorFirstComposition f g (Wrap x)
    = cong (bifunctorFirstComposition f g x)
  bifunctorSecondComposition f g (Wrap x)
    = cong (bifunctorSecondComposition f g x)
