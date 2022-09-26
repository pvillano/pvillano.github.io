---
title: "Openscad Facet Size"
date: 2022-09-26T19:47:49-04:00
draft: true
Description: ""
Tags: []
Categories: []
---
I recommend starting with the following settings as a baseline, and increasing `$fs` if the GUI becomes slow.
```openscad
$fn=.01;
$fs=.3;
```
# Background
Three variables determine the facetedness of your model.
* **$fa** is the minimum angle for a fragment.
It creates a size-independent upper bound for number of facets in a circle.
This bound is exactly `ceil(360/$fa)`
* **$fs** sets the minimum facet size in millimeters.
* **$fn** is a complete override on the number of facts.

#Performance
I used to use different quality levels for preview and render with the code snippet.
```
$fa=.01;
$fs=$preview ? 5 : .1;
```
This allowed me to edit at interactive rates but render at the highest resolution visible on my printer.
I no longer recommend this, because it can lead to unexpectedly long render times.
Depending on the model, halving the minimum facet size can increase the rendering time 16-fold!

I now prefer to set a single facet size, and increase it when the GUI slows down.
//What you see is what you get
//It is important to be considerate of other people using my work. That they 

More info on facets can be found at [the OpenScad Wikibook](https://en.wikibooks.org/wiki/OpenSCAD_User_Manual/Other_Language_Features#.24fa.2C_.24fs_and_.24fn)