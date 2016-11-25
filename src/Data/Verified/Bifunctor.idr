module Data.Verified.Bifunctor

import public Data.Bifunctor

%access public export

||| Verified Bifunctors
||| A Bifunctor for which identity and composition laws are verified.
interface Bifunctor p => VerifiedBifunctor (p : Type -> Type -> Type) where
  bifunctorIdentity          : (x : p a b) -> bimap Basics.id Basics.id x = x
  bifunctorFirstIdentity     : (x : p a b) -> first Basics.id x = x
  bifunctorSecondIdentity    : (x : p a b) -> second Basics.id x = x
  bifunctorComposition       : (f : a -> c) -> (g : b -> d) -> (x : p a b) ->
                               bimap f g x = (first f . second g) x
  bifunctorBimapComposition  : (f : b1 -> c) -> (g : a -> b1) ->
                               (h : c1 -> d) -> (i : b -> c1) -> (x : p a b) ->
                               bimap (f . g) (h . i) x = bimap f h (bimap g i x)
  bifunctorFirstComposition  : (f : b -> c) -> (g : a -> b) -> (x : p a b) ->
                               first (f . g) x = first f (first g x)
  bifunctorSecondComposition : (f : c -> d) -> (g : b -> c) -> (x : p a b) ->
                               second (f . g) x = second f (second g x)

implementation VerifiedBifunctor Either where
  bifunctorIdentity (Left _)                  = Refl
  bifunctorIdentity (Right _)                 = Refl
  bifunctorFirstIdentity (Left _)             = Refl
  bifunctorFirstIdentity (Right _)            = Refl
  bifunctorSecondIdentity (Left _)            = Refl
  bifunctorSecondIdentity (Right _)           = Refl
  bifunctorComposition _ _ (Left _)           = Refl
  bifunctorComposition _ _ (Right _)          = Refl
  bifunctorBimapComposition _ _ _ _ (Left _)  = Refl
  bifunctorBimapComposition _ _ _ _ (Right _) = Refl
  bifunctorFirstComposition _ _ (Left _)      = Refl
  bifunctorFirstComposition _ _ (Right _)     = Refl
  bifunctorSecondComposition _ _ (Left _)     = Refl
  bifunctorSecondComposition _ _ (Right _)    = Refl

implementation VerifiedBifunctor Pair where
  bifunctorIdentity (_, _)                  = Refl
  bifunctorFirstIdentity (_, _)             = Refl
  bifunctorSecondIdentity (_, _)            = Refl
  bifunctorComposition _ _ (_, _)           = Refl
  bifunctorBimapComposition _ _ _ _ (_, _)  = Refl
  bifunctorFirstComposition _ _ (_, _)      = Refl
  bifunctorSecondComposition _ _ (_, _)     = Refl
