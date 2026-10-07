---
title: "(Screaming) Hello"
date: 2026-10-07
draft: false
---
![screaming.png](screaming.png)

(screaming) is a large-as-possible text display for silent but conspicuous communication.
The name is a reference to screenplay parentheticals.

# Usage
Type something. The font size will be automatically adjusted
so that the text is as large as possible.

You can share or bookmark the link after typing,
and the same text will be displayed.

There's a fullscreen toggle in the top right
and a link to this page on the bottom right.

The url is [screaming.saej.in](https://screaming.saej.in/).

# Development

The problem of making text large looks
like it could be solved with a single AI prompt.
The first 90% of (screaming) was a single AI prompt.
The [second 90%](https://wikipedia.org/wiki/Ninety–ninety_rule) took much longer.

## Making text as large as possible is mostly just binary search.

* Set up a textarea to resize to fit its contents.
* Maintain an interval of possible font sizes, starting with [5, 1000].
* Do the following until there is only one possible font size.
    * Pick a number _x_ in the middle of the current range,
    * Set the font size to _x_
    * Measure the textarea after it has resized.
    * If the textarea is too tall or wide to fit on the screen:
      * The best font size is less than _x_.
      * Update the maximum value of the range to _x_ - 1.
    * If the textarea fits on the screen:
      * The best font size is greater than or equal to _x_.
      * Update the minimum value of the range to _x_ exactly.

Unfortunately, this algorithm will sometimes fail spectacularly,
and produce tiny text when there is plenty of space.

## The problem was trailing spaces.

When typesetting text with a typewriter,
you don't need to put a space before a line break.
If I only have eight characters of width,
I can still typeset "Hello my darling!".
"hello" and "my" fit on one line.

```text
  12345678
1 hello my
2 darling!
```
The space is still there, it's just hiding in the margin:

```text
  12345678
1 hello_my_
2 darling!
```

In Firefox, the scrollWidth of an element includes trailing spaces!

The font size can be small enough for all the text to fit on the page,
but the original resizing algorithm only knows that the textarea's `scrollWidth` is greater than it's `clientWidth`,
so it tries smaller and smaller font sizes.

## The solution was zero-width spaces.

There are only two reasons text will not fit in a box.
Either the text is too many lines tall,
or one word is so long that it cannot fit on a single line.

The fixed algorithm creates a copy of the original text,
but with all the whitespace replaced with zero-width spaces.
If the font size makes a single word too wide,
the copy will have a `scrollWidth` greater than it's `clientWidth`.
If the font size makes the wrapped text too tall,
the original text will have a `scrollHeight` greater than it's `clientHeight`.

If you want to read the code for yourself,
just view the page source at [screaming.saej.in](https://screaming.saej.in/).
