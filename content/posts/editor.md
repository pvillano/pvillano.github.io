---
title: "What I want from Syntax Highlighting"
date: 2026-05-18T18:12:43-04:00
draft: true
---
## My beefs
* too many colors
* too much color
* rainbow brackets don't work.
  * lost in a sea of color
* everyone's themes are desaturated to illegibility

## existing conventions
* scientific pseudocode/algorithms latex
  * everything serif
  * variables are italic
  * keywords are bold
  * only comments are monospace lol
* JetBrains Islands light
  * underlines parameters
  * blue keywords
  * orange object methods
  * purple object variables
  * turquoise local variables
  * italic exported variables
  * gray comments
  * highlighted tan and desaturated: inline type hint

## what are my goals for syntax highlighting
* channels
  * syntax highlighting may make full use of
    * serif/non-serif
    * bold/italics
    * highlight
    * underline
    * underline color
    * underline style: squiggle, dotted
* skimability
  * **TODOs** should pop out
  * **errors** should be red squiggle underlined
  * **warnings** should be yellow squiggle underlined
  * **typos** should be squiggle-underlined red in text documents
  * **grammar errors** should be underlined with a blue squiggle
  * **declarations/definitions** should be easy to find
* don't get confused
  * comments, especially commented out code should be a different color from regular code (grey or green)
  * when editing a deeply nested JSON, HTML, etc., make the current scope obvious by highlighting the current scope
  * we may wish to make local variables, parameters, class variables, global variables, and global constants to appear different.
    * helps skimmability in languages which do not require `this` or `self` for referencing class variables
    * **can easily result in Christmas tree effect**
    * most of the printable characters are identifiers, with the rest being operators and keywords. 
    * In a scripting language, most of your variables are global, so global variables must be black
  * in languages with first-class functions, we may wish to make functions a different color to catch when we accidentally forget to call a function 
  * 
* 50% of visible characters are black on white
* current scope is highlighted, not the current line
  * wtf is the point of highlighting the current line?
* commented out code is 
* some 
