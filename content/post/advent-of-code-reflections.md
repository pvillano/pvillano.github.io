---
title: "Advent of Code Reflections"
date: 2024-01-11T13:35:40-04:00
draft: false
Description: "Reflections on the 2023 Advent of Code Competition"
Tags: []
Categories: []
---
## Introduction
This year's Advent of Code was a good year for me.
I scored in the top 100 twice, on days 11 and 12.

I never used my auto-submitter,
but I did use my input fetcher and testing methods.
Every year I start having forgotten what these functions do,
and by the end I've made them more complex than they were the previous year.

`extract_ints()` proved to be very useful this year.

## Day 5: This then That, not Th\[That\]is
My solution for day 5 is not the obvious solution.
The obvious solution would be to modify an algorithm for merging intervals.
This would require writing an algorithm inside an algorithm, with mixed concerns and many special cases.
I instead split the problem into two stages.
First, I constructed a list of intervals where each interval would not be split during the mapping stage.
Then, I did the mapping stage.

## Day 7: Data not code, Counters of Counters
My solution for day 7 is several thousand lines shorter than one of my peers.
This is because instead of counting n-of-a-kind with loops, I used Counters of Counters.
We only care about how many pairs etc. are in the hand, not values of the cards themselves.
So, after using a counter to transform `AAQQK` to `{"A":2, "Q":2, "K":1}` we can discard the card values to get just the counts: `[2, 2, 1]`.
We then send this through another Counter to get `{2:2, 1:1}`, meaning two pair, one single.
This value contains only the relevant information to determine the value of the hand,
and can be compared to directly using a match case statement.

## Day 10: The Dual Graph: A Shift in Perspective
I used the dual graph for day 10 part 2.
Water can flow between parallel pipes, which means the graph which represents where the water can flow should have its edges in between two parallel pipes.
If we think of the pipe graph as a collection of cells linked by adjacent borders,
the dual graph consists of nodes at the points where four cell corners meet.
The dual graph of a grid can also be constructed by rotating every edge 90 degrees about its center.

This video is a clearer example of the usefulness of the dual graph: [Percolation: a Mathematical Phase Transition](https://www.youtube.com/watch?v=a-767WnbaCQ)

## Day 11: Transpose: A Shift in Perspective
Day 11 was the first time I used `important_constant = 100 if input_str == test_input else 1000000`; a neat trick.
The `transpose` method was useful for getting a good time.
It allows the programmer to iterate through columns with less boilerplate.

## Day 13: Origami
I found it simpler to split a list and reverse half than try to index from the center out.
My algorithm works in a similar way to folding a printed page in half and holding it up to the light to see if it is symmetric.

## Day 16: Map, Reduce, Reuse, Recycle
Calling part1() from part2() is always fun.
It justifies me writing them as functions instead of a series of statements in the global namespace.

## Day 20: Looking for Answers
I had to visualize the graph to realize there were independent loops of different lengths that had to align, similar to the ghosts problem.

## Conclusion
I haven't finished all the problems yet, so no conclusion.