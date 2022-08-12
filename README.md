# Dependently Typed Programming with Finite Sets
This repository contains the Agda code associated with the paper "D. Firsov, T. Uustalu. [Dependently Typed Programming with Finite Sets](http://dx.doi.org/10.1145/2808098.2808102)" published at WGP 2015.

## Contents

- [Finiteness.agda](Finiteness.agda) -Listable sets and listable subsets.
	- [Examples/Pauli.agda](Examples/Pauli.agda) - The example of a straightforward approach of defining new finite.
- [Combinators.agda](Combinators.agda) - Basic combinators on listable sets and subsets.
	- [Examples/Combinators.agda](Examples/Combinators.agda) - Simple example of using combinators.
- [FiniteSubset.agda](FiniteSubset.agda) - The alternative way of defining the new finite sets as a subsets.
	- [Examples/FiniteSubset.agda](Examples/FiniteSubset.agda)
- [Tabulation.agda](Tabulation.agda) - Defining new functions from finite sets by providing an explicit; table + proofs of correctness.
	- [Examples/Tabulation.agda](Examples/Tabulation.agda) -  Example of a function definition by using tables.
- [PredicateMatching.agda](PredicateMatching.agda) - Defining new functions from the list of predicate--function pairs and proofs of correctness.
	- [Examples/PredicateMatching.agda](Examples/PredicateMatching.agda) 
- [Prover.agda](Prover.agda) - Prover for propositions quantified over finite sets.
	- [Examples/Prover.agda](Examples/Prover.agda) - Comapring the approaches of automatically deriving the properties for finite types.

## Setup
Agda @ 2.6.0.1, agda-stdlib @ 1.1-1
