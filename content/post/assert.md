---
title: "Assert Considered Helpful"
date: 2022-05-25T13:35:26-04:00
draft: false
---

Last Advent of Code I took to putting assert statements for every invariant in my code. Most of my time was spent debugging, not the first write or running code. Adding so many asserts provided a number of benefits:

  * Assert statements are a compact form of documenting invariants, both expected and produced, making code easier to reason about.
  * Each assert serves as a concise unit test with exactly the necessary cases.
  * Most importantly, asserts catch logic bugs when code doesn't produce the intended results

Writing about this has me thinking, there should be a tool to transform assert statements into testing. The tool would have another keyword "expect" in addition to "assert", for preconditions. With both preconditions and postconditions, individual functions can be automatically verified with a prover or a fuzzer! The tool could also check that preconditions are met at each call site, without having to write and rewrite unit tests for each call site!