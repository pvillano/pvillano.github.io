---
title: "The Future of Compilers"
date: 2026-01-02T21:56:50-05:00
draft: false
Description: ""
Tags: []
Categories: []
---

I think there will soon come a day when computers have superhuman proof-writing ability.
In other words, for a given theorem,
a computer could write a formalized proof in less time than a human.
Capable automated theorem provers would drastically change the way software is written.

In this future, the enforcement of correctness is not limited to running checks at runtime 
or restricting allowed memory access patterns. 
Instead, source code is divided into conditions and executable code. 
The compiler includes a _verifier_ which checks, 
at compile time, 
that the execution of the program transforms the preconditions into the postconditions.
Any code that a human could prove correct is proven automatically.

In this future, most software is developed solely through the specification of preconditions and postconditions, 
and a large language model (LLM) generates the executable code. 
The LLM and the _verifier_ form a feedback loop that produces code
that correctly transform the preconditions into the postconditions. 
This LLM is considered part of the compiler, and the code it generates is stored with the other compiler artifacts.

People still write code for performance critical regions, but this is as rare as people writing assembly is in the present.

The _verifier_ itself is part LLM. 
The LLM is used as a heuristic to prune the impossibly large search space of all possible proofs of correctness/incorrectness. 
Only a "small" number candidate proofs are checked by a deterministic theorem prover until a valid formalized proof is found. 
I predict that the DeepMind team will be the first to get this to work.

The process of proof generation runs on cheap GPU instances in the cloud. 
Occasionally someone asks on Reddit why their program never passes or fails, 
and it's because they put an unsolved problem in their post-conditions.

Speaking of unsolved problems: in this future, multiple millennium problems are "solved" by researchers at cloud service providers. 
In this context, "solved" means a formalized proof was found through a LLM-pruned search. 
Academic responses are mixed, since none of these proofs are remotely human readable. 
However, these unreadable proofs do inspire new proof techniques, like AlphaGo did for go.

I really think all of these things will happen. 
There are only a few things that need to happen first. 
We need a new language, extension of an existing language, or revival of a dead language with first-class specification support. 
We need a way to translate the conditions and operations of that language into Rocq or Lean. 
We need the DeepMind team to release AlphaProof, the proof-search algorithm. 
We need to put both the verifier and agent in the compiler. That's about it.
