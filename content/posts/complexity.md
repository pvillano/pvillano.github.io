---
title: "Complexity Management Zoo"
date: 2025-10-28T01:47:40-07:00
draft: true
---

# Foreword

I abandoned writing an article about irreducible complexity
when I started working for a vibe-coding founder.
He introduced unnecessary complexity at such a rate that I and the other programmer
gave up on trying to code review
and just fixed bugs as they were discovered.

More recently, I read a comment detailing a software developer's system to manage complexity for their amnesic stochastic parrot,
so maybe there is still some interest.
Though my original intent of approaching irreducible complexity is no longer possible

# My conception of complexity

One of the hardest problems in software development is managing complexity.

A piece of software can be complex for two major reasons:
1. Human/artificial fallibility
2. It has to do something complex.

Human/AI imperfection leads to overcomplicating things.
This creates complexity that can be removed without losing functionality.
Examples include:
* unnecessary optimization, extensibility, abstraction, or features
* multiple implementations of the exact same thing
* tech debt: code that has been repeatedly extended without reorganization

Some complexity is unavoidable. A complex problem often requires a complex solution.
Examples include:
* Models of complex phenomena
* Systems that don't fit on a single computer and must be distributed
* High-performance systems that require optimization
* Operating systems that have to do a lot of different things.

# A Complexity Management Zoo

This list is incomplete. You can help by emailing me.

## Starting over

The current thing is too complicated.
Let's build a new one from better principles.
Our new one is beautiful and uncomplicated.
It lacks features, let's add them.
The current thing is too complicated.

Starting over can be helpful,
but it is important to identify beforehand
how much complexity can be removed.
If the foundation was built on an incorrect guess
of what the future would be, then starting over may be necessary.

Relevant XKCD: [Standards](https://xkcd.com/927/)

## Using a different language

I'll catch myself reading an article on Forth
and wondering if code could really could be so simple. It cannot.
The examples are simple programs.

Sometimes there is an impedance mismatch between a language
and the idea it is being used to express.

In their post "simple is not small",
Jynn Nelson compares two programs that print the n most frequently used words in a file.
Doug McIlroy's (famous?) six-command shell pipeline 
and Nelson's implementation in Clojure have the same length.
However, they differ when extended to show the output in the original file order.
Nelson's remains the same length but the shell pipeline doubles in length
and becomes significantly more difficult to understand.

The extended shell pipeline is difficult to understand
because the language was not optimized to express stateful programs. 

## Hide it: OOP

Object-oriented was supposed to hide complexity.
Anything could be going on inside the object,
but only a limited interface is presented
for the non-implementer to interact with.

I don't like hiding complexity.

## Isolate it: Rust

Rust tries to isolate complexity. 
You don't have to check the entire program for (most) memory errors,
only the unsafe blocks.

It's impossible in general to have a compiler that accepts all memory-safe programs
and rejects ones with memory errors.
It's undecidable.
It's also very hard for non-trivial cases.
So the language/checker/compiler only allows programs to be composed of simple cases.
Composing a complex program out of a limited set of memory-safe atoms can become unergonomic,
to say the least.

Some really smart people are working on allowing the checker to pass more complex cases.
This makes the language more expressive and improves ergonomics.
However, I ~~predict~~ originally predicted that one day,
the checker will have become so complicated
that a bug will be found in the checker in the form of a Rust program that compiles
but has a memory error.
With LLM-augmented automated theorem provers,
we may have a fully verified borrow checker in my lifetime. Exciting.

I liked the idea of putting the complexity in one place when I first heard about Rust.
I didn't consider that the act of centralizing complexity creates additional complexity.

## Hand it to someone smarter: libraries.
I can't write a performant and correct mutex.
There are probably only a few people in the world who can.
This doesn't entirely remove the complexity from your hands.
There is also complexity overhead with libraries.

## divide it logically: "Functional core, imperative shell"

tries to bisect complexity into two kinds
and physically separate them.

It's a dual centralization.

## pretend? : React

React's fake immediate-mode-rendering is another rearrangement of complexity

React wants you to imagine rendering as a descent down a tree.
A series of boxes that decide the layout of boxes inside them deeper and deeper.
Each box is a pure function of its props.
Because they're pure functions you can do some really neat optimization tricks.

{{< details summary="Aside" >}} There was a great series on this abstraction
and how it was implemented that I never truly understood.
I thought the concepts were simply too complex for me to understand.
Later, the same blog blamed poor software quality on women,
so maybe he was crazy the whole time and it wasn't my fault. {{< /details>}}

The problem is state.

My complaint with React is that it lies to you a lot.
Your function isn't called every frame.
The stack isn't there.
The rules of hooks are narrower than they need to be.

# Couple it: monorepos

# Conclusion

There also exists complexity that cannot be removed.
It can be centralized, distributed, rearranged, or hidden.
Hiding is the worst. Don't do that.
You have to decide where your complexity is going to live.

Template:

# Name: Example
* explanation
* generalization
