---
title: "Redesign"
date: 2026-04-25T15:16:22-04:00
draft: true
---

I took inspiration from
* https://fabiensanglard.net/
  * All pages
    * titles are all caps
    * Horizontal lines separating sections, do not reach end
    * a bold font
    * links underlined, but not blue
  * Main page:
    * name
    * navigation
    * description
    * posts
  * Article
    * each heading has a full line separator 
* https://ciechanow.ski/
  * All pages
    * name at the top
    * navigation left, social right
    * usually, bg white
  * Main page
    * whole article
  * article
    * headings slightly lighter, bold,
* https://www.jeffgeerling.com/
  * all pages
    * link underlined green
    * link hover highlighted green (ew)
  * front page
    * name | contact
    * one line bio
    * article stubs
  * Article
    * larget title
    * desaturated date
    * images are centered, 3/4 width
    * headings larger
* https://aphyr.com/
  * All pages
    * article titles underlined on hover
    * links are accent blue
    * nav is animated weirdness
    * the article floats with shadow above a textured background
    * date desaturated and tiny
  * main page
    * stubs floating above a pinned background
  * article
    * headings underline on hover with anchors
* substack(?) https://www.experimental-history.com/
  * all pages
    * icon | title of the site | subscribe
    * a horizontal line across the whole page separates the header from the body
  * main page
    * uninspiring mess
  * article
    * title
    * desaturated subtitle
    * author with icon??
    * body is serifed
    * titles are sans-serifed
    * 
* https://acko.net/ 
  * uninspiring

shrinking margins at lower resolutions

/*
map(unmap(x, a, b), c, d)
map((x-a)/(b-a), c, d)
c + (x-a)/(b-a) * (d-c)
c + x(d-c)/(b-a) - a(d-c)/(b-a)
x(d-c)/(b-a) + (c(b-a) - a(d-c)/(b-a)
x(d-c)/(b-a) + (bc - ac - ad + ac)/(b-a)
x(d-c)/(b-a) + (bc - ad)/(b-a)

a=

margin: clamp(2px, -1.4286px + 1.4286vw, 32px);
