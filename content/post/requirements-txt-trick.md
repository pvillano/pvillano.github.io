---
title: "Requirements Txt Trick"
date: 2021-11-27T17:41:57-05:00
draft: true
---

Or you can keep an un-versioned* requirements.txt, and every month/CVE re-freeze it
```
  #!/bin/bash
  docker run -v "$(pwd)":/req -w /req python:3.9.1-slim-buster \
  sh -c "pip install -r requirements.txt \
  && echo \"#$(date)\" > requirements-frozen.txt \
  && pip freeze >> requirements-frozen.txt"
```
\* as pinned as you like: major, minor, greater than etc.