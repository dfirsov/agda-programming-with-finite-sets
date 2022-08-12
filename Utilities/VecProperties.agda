

module Utilities.VecProperties where

open import Relation.Binary 
open import Relation.Binary.PropositionalEquality 
  hiding (inspect)
open import Relation.Binary.Core 
open import Relation.Nullary

open import Data.Bool hiding (_≟_)
open import Data.Sum  hiding (map)
open import Data.Product hiding (map)
open import Data.Maybe hiding (map)
open import Data.List hiding (lookup; allFin)
open import Data.Fin 
  hiding ( _≤_ ; _<_) 
  renaming (suc to fsuc ; zero to fzero ; pred to fpred)
open import Data.Empty 
open import Data.Nat
open import Data.Unit hiding (_≤_ ; _≟_)
open import Data.Vec 
  renaming (map to vmap ; _++_ to _++v_ ; _∷_ to _::_) 
  hiding (drop ; take ; foldl ; foldr ; lookup)  

open import Level hiding (suc ; zero)

open import Data.Vec.Properties hiding (map-cong)

open import Utilities.FinProperties
open import Utilities.BoolProperties
open import Utilities.ListProperties 
open import Utilities.ListsAddition
open import Utilities.Logic


infix 4 _∈v_

data _∈v_ {a} {A : Set a} : A → {n : ℕ} → Vec A n → Set a where
  here  : ∀ {n} {x}   {xs : Vec A n} → x ∈v (x :: xs)
  there : ∀ {n} {x y} {xs : Vec A n} (x∈xs : x ∈v xs) → x ∈v y :: xs


lookup : ∀ {a n} {A : Set a} → Fin n → Vec A n → A
lookup 0F  (x :: xs) = x
lookup (fsuc i) (x :: xs) = lookup i xs

∈∈v : ∀{a} {X : Set a} → {n : ℕ} → (x : X) → (v : Vec X n)  → x ∈ toList v → x ∈v v 
∈∈v x [] ()
∈∈v x (.x :: v) here = here
∈∈v x (x₁ :: v) (there pr) = there (∈∈v x v pr)


∈∈v2 : {X : Set} → {n : ℕ} → ∀ x → (v : Vec X n)  →  x ∈v v → Σ[ i ∈ Fin n ] lookup i v ≡ x
∈∈v2 x [] ()
∈∈v2 x (.x :: v) here = fzero , refl
∈∈v2 x (x₁ :: v) (there inp) with ∈∈v2 x v inp 
... | o1 , o2  = fsuc o1 , o2

toListC : {X : Set} → {n : ℕ} → (i : X) → (v : Vec X n) 
  → i ∈v v → i ∈ toList v
toListC i ._ here = here
toListC i ._ (there iv) = there (toListC i _ iv)

postulate ∈-allFin : ∀ {n} (i : Fin n) → i ∈v allFin n

allFinListComplete : ∀ n → (i : Fin n) → i ∈ allFinList n
allFinListComplete n i = toListC i (allFin n) (∈-allFin i)
