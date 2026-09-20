---
title: "(Screaming) Hello"
date: 2026-09-19T18:25:02-04:00
draft: true
---

(screaming) is a large-as-possible text display for silent but conspicuous communication.
The name is a reference to screenplay parentheticals.

# Usage
Type something. The font size will be automatically adjusted
so that the text is as large as possible.

You can copy or bookmark the link after typing,
and the same text will be displayed.

There's a fullscreen toggle in the top right
and a link to this page on the bottom right.

The url is [screaming.saej.in](https://screaming.saej.in/).
Like all [my projects](https://saej.in/portfolio/),
enough of the URL can be typed with only the left hand
that it autocompletes
without ever having to move your right hand from the mouse.

# Development

The problem of making text large looks
like it could be solved with a single AI prompt.
The first 90% of (screaming) was a single AI prompt.
The [second 90%](https://wikipedia.org/wiki/Ninety–ninety_rule) took much longer.

## Making text as large as possible is mostly just binary search

* Let the textarea resize based on its contents.
* Maintain an interval of possible font sizes, starting with [5, 1000].
* Do the following until there is only one possible font size.
    * Pick a number _x_ in the middle of the current range,
      set the font size to this value,
      and measure the textarea after it has resized.
    * If the textarea is too tall or wide to fit on the screen,
      then the best font size is less than _x_.
      Update the maximum value of the range to _x_ - 1.
    * If the textarea fits on the screen,
      then the best font size is greater than or equal to _x_.
      Update the minimum value of the range to _x_ exactly.

The AI produced something close to this,
but missed the fine details of the inequalities.
After fixing those details,
the code still sometimes failed spectacularly,
sometimes producing tiny text with a huge amount of empty space.

## The code didn't work for an amazing reason.
Font sizes that could fit text on the screen just fine
would cause the textarea to extend past the allowable area.
The algorithm would see that the textarea was too wide,
and repeatedly try smaller sizes,
much smaller than necessary,
until one gave the textarea dimensions that fit.

## The problem was spaces.

Consider typesetting a monospace `hello world` on a screen five inches wide.
both "hello" and "world" are five letters long,
so each letter can be one inch wide.
```text
12345
hello
world
```

So then where is the space?
Spaces typically have a fixed width: just look between the words you are reading.
The space hides in the margin.

```text
12345
hello_
world
```

The text engine lays out the words such that no word exits the boundary,
but the dimensions of the textarea are measured including trailing spaces.

The width of the textarea is therefore an unreliable metric of
whether the font size is too big.

## The solution was zero-width spaces.

There are only two reasons text will not fit in a box.
Either there are too many lines,
or one word is so long that it cannot fit on a single line.

So, we create a copy of the original text,
replace all the spaces with zero-width spaces,
and look at how wide it is.
The target width is the same as before,
but the width is not expanded by spaces,
only by overly long words.

## Text layout is hard in general

See the [Knuth-Plass line-breaking algorithm](https://wikipedia.org/wiki/Knuth%E2%80%93Plass_line-breaking_algorithm)

In writing this, I was able to trigger a visual glitch in Firefox's text rendering.
It probably depends on resolution and scaling, but [this](https://screaming.saej.in/?q=hello+++++world++++++++)
is the text I used to trigger it:
two words, each followed by a number of spaces.
Navigating with the arrow keys causes chunks of the text to shift
but not the whole page.


![Image of corrupted](corrupted.png)
