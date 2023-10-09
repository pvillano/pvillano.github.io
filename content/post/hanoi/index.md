---
title: "The Two Billion Towers of Time"
date: 2023-10-08T20:00:46-05:00
draft: false
Description: "A clock"
Tags: ["clock", "animation", "canvas", "javascript"]
Categories: []
---


{{< hanoi >}}
## <q>"When the final tower is completed, time will overflow." </q>

The above [animation]({{< relref "#animation">}}) counts down to the [Epochalypse]({{< relref "#epochalypse">}})
by displaying the current [Unix time]({{< relref "#unix-time">}})
as progress in solving the [Tower of Hanoi]({{< relref "#hanoi">}}).

### Unix Time? {#unix-time}
The Unix Time is the number of seconds which have passed since the start of the '70s[^definition]
The current Unix time is {{< unixtime >}}.
Because of its simplicity, Unix Time is widely used in computing.

### Epochalypse? {#epochalypse}
Many pieces of software store Unix timestamps in 32-bit signed integers.
This data type has a limited range, so at some point the current Unix time will exceed the allocated space and cause problems.

### Tower of Hanoi? {#hanoi}

{{< hanoi n=3 >}}

The [Tower of Hanoi](https://wikipedia.org/wiki/Tower_of_Hanoi) is a mathematical puzzle consisting of three stacks of discs.
The objective of the puzzle is to move every disc to the last stack.
The player can repeatedly move the topmost disc from one stack to another stack,
as long as they never place a larger disc onto a smaller disc.

The minimal number of moves required to solve a Tower of Hanoi puzzle is 2*{{< sup >}}n{{< /sup >}}* − 1,
where *n* is the number of disks.

### Animation? {#animation}

If you've ever programmed a solution to the Tower of Hanoi, you might be confused as to how 

* The k-th move can be computed directly from the binary representation of k
* A quick enough mathematician could tell what time is displayed

### Secret Stone?
TODO: the animation could be smoother when it only goes up or only goes down.

[^definition]: It is defined precisely as the number of non-leap seconds which have passed since 00:00:00 UTC on 1 January 1970.