---
title: "Physically Based Rendering in Css"
date: 2021-11-27T17:37:25-05:00
draft: true
Description: ""
Tags: ["css", "PBR"]
Categories: []
---


"Physically Based Rendering in CSS" sounds kind of silly, but here we go

First, the width of the blurred region (penumbra). Imagine putting a camera on the ground and pointing it at the sun. By moving the camera in and out of shadow, it can see more or less of the sun. Intuitively we know that the higher the box is, the bigger the penumbra. The sun has an apparent size of .53°, and so does the region of partial shadow descending from the edge of the box. Some trigonometry later, and The ratio of the width of the penumbra to the elevation of the box is .00925 or about 1%

Next, we can calculate what portion of the sun is visible from the penumbra. The amount of sun visible is a portion of a circle, so we do an integral of a circle function and hoo boy would that be a pain to type on mobile. The graph is sort of a `smoothstep` shape, but is very close to linear 