---
title: "Hashes as Images"
date: 2021-11-27T17:40:42-05:00
draft: true
Description: ""
Tags: []
Categories: []
---
Similarity attacks can be mitigated in the following ways:

1. Create as much perceptible variation as possible - TV static and minor color changes are not.
2. Make representations humans can remember - faces or images over abstract objects/shape color combinations
3. Make generating each representation expensive, so that searching for a visually similar fingerprint is expensive.

IMO most hash visualizers fail at all 3.

[3] is similar to hashing itself, except "visually similar" is substituted for "exactly equal". This is already taken care of by the hashing algorithm if it is slow, e.g. password hashing algorithms.

[1,2,3] could be solved with a GAN. Note that the GAN does not have to worry about making similar hashes produce dissimilar outputs, because finding a similar hash is already hard. 