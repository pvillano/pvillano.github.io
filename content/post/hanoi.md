---
title: "The Two Billion Towers of Time"
date: 2023-10-08T20:00:46-05:00
draft: false
Description: "A clock"
Tags: ["clock", "animation", "canvas", "javascript"]
Categories: []
---


{{< hanoi >}}
## {{<q>}}When the final tower is completed, time will overflow.{{</q>}}

The above [animation]({{< relref "#animation">}}) counts down to the [Epochalypse]({{< relref "#epochalypse">}})
by displaying the current [Unix time]({{< relref "#unix-time">}})
as progress in solving a 32 level [Tower of Hanoi]({{< relref "#hanoi">}}).

### Unix Time {#unix-time}
The Unix time is the number of seconds which have passed since midnight, January 1, 1970, UTC.
Computers use Unix time internally to store dates and times as a single number.
The current Unix time is {{< unixtime >}}.

### Epochalypse {#epochalypse}
Many pieces of software store Unix timestamps in 32-bit signed integers.
This data type has a limited range, so at some point in the future the current Unix time will exceed the allocated space and cause problems.

### Tower of Hanoi {#hanoi}
The Tower of Hanoi is a puzzle about moving a stack of discs from a first position to a third position.
Its difficulty comes from three restrictions.
Firstly, the player may only move one disc at a time.
Secondly, the player may never place a larger disc onto a smaller disc.
Lastly, the discs must be placed in one of only three stacks, including the starting and ending positions.

As the number of discs increases, the number of moves it takes to solve the puzzle grows exponentially.
For three discs, the puzzle can be solved in seven moves, but for 32 discs, the solution requires over two billion moves.

### Animation {#animation}

There's some neat things going on.

* Most algorithms for solving the Tower of Hanoi compute each step in order. This one computes the *k*-th state directly.
* The position of the moving piece is also computed directly from the milliseconds place.
* It is possible to recover the exact time from the animation!
* The arcing path of the moving piece is optimized to minimize its maximum x and y acceleration.
* This is my first time animating with JavaScript and the `canvas` API