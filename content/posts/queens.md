---
title: "How to solve the Queens Game"
date: 2025-08-01T13:51:02-07:00
draft: false
Description: ""
Tags: [ "puzzles", "queens", "linkedin"]
Categories: [ ]
---

Here are all the strategies you need to beat [that one queens puzzle](https://www.playqueensgame.com/) on LinkedIn.

1. If a region, row, or column has one available square, there's a queen there.
2. If a region has only a few squares,
   it's likely some squares around it cannot contain queens
   without blocking the entire region.
3. Equivalently, if a region has only a few squares,
   the superposition of every placement of a queen within that region will block some squares.
4. Some shapes, like L, Z, S, U, J, 1x2, 1x3 have spots around them where no queen can be.
5. If there's only one region in a row or column,
   then that region cannot have queens outside that row or column.
6. If n regions are contained entirely within n rows or n columns,
   there cannot be any queens in regions that partially overlap these columns.
7. If n rows or n columns are covered entirely by n regions,
   those regions cannot have queens outside those rows or columns.
8. When all else fails, place a queen randomly and keep solving,
   keeping count of how many queens you've placed.
   If you run into a contradiction, backtrack and place an X.
   If you don't run into a contradiction, backtrack
   and try another random placement.
9. When placing a queen randomly, go for regions, rows, or columns with 2 or 3 available spaces.
   That way, a contradiction will result in placing a queen.
10. When placing a queen randomly, go for spots that seem like they eventually won't work,
    so that you can backtrack and pace an x.
    The goal isn't to dodge invalid solutions,
    the goal is to eliminate every invalid solution until only the actual solution remains.
11. Puzzles may have multiple solutions :/

In part two, I'll show how you can develop a similar set of rules for any logic puzzle.
