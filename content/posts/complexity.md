---
title: "Complexity Management Zoo"
date: 2025-10-28T01:47:40-07:00
draft: true
---

One of the hardest problems in software development is managing complexity.

A piece of software becomes complex for two major reasons:
1. Human/Artificial fallibility
2. It has to do something complex.

Number one is overcomplicating things.
Complexity that can be removed without losing functionality.
Enterprise-grade code, unused features, blah blah blah
This includes microservices, or writing your system in brainfuck.
LLMs have made the process of overcomplicating things much more efficient.

Number two is what I would call irreducible complexity.
Business logic.

When you have systems that don't fit on a single computer,
they have to be distributed.

Template:

# Name: Example
* explanation
* generalization

# Start over: UI frameworks, system programming languages

The current thing is too complicated.
Let's build a new one from better principles.
Our new one is beautiful and uncomplicated.
It lacks features, let's add them.
The current thing is too complicated.

The grass is greener on the side with no construction.

I'll catch myself reading an article on Forth
and wondering if code could really could be so simple.

It

Related XKCD: [Standards](https://xkcd.com/927/)

# Hide it: OOP

Object-oriented was supposed to hide complexity.
Anything could be going on inside the object,
but only a limited interface is presented
for the non-implementer to interact with.

I don't like hiding complexity.

# Isolate it: Rust

Rust tries to isolate complexity. 
You don't have to check the entire program for (most) memory errors,
only the unsafe blocks.

It's impossible in general to have a compiler that accepts all memory-safe programs
and rejects ones with memory errors.
It's undecidable.
It's also very hard for non-trivial cases.
So the language/checker/compiler only allows programs to be composed of simple cases.
Composing a complex program out of a limited set of memory-safe atoms can become unergonomic, to say the least.

Some really smart people are working on allowing the checker to pass more complex cases.
This makes the language more expressive and improves ergonomics.
However, I predict that one day, the checker will have become so complicated
that a bug will be found in the checker in the form of a Rust program that compiles but has a memory error.

I liked the idea of putting the complexity in one place when I first heard about Rust.
I didn't consider that the act of centralizing complexity creates additional complexity.

# Hand it to someone smarter: libraries.
I can't write a correct mutex.
There are probably only a few people in the world who can.
This doesn't entirely remove the complexity from your hands.
There is also complexity overhead with libraries.

# {TODO}: Unit testing

Does unit testing help with complexity?
There was that guy that worked at Oracle who had to deal with a million tests
and would introduce lots of complexity to get things to pass.
That was probably necessary complexity

# divide it logically: "Functional core, imperative shell"

tries to bisect complexity into two kinds
and physically separate them.

It's a dual centralization.

# pretend? : React

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
