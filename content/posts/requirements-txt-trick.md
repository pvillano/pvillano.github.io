---
title: "requirements.txt Trick"
date: 2021-12-28T02:17:28-05:00
draft: false
Description: ""
Tags: []
Categories: []
---
Sometimes you find yourself in a legacy project with a single requirements.txt file containing pinned dependencies.
A CVE is released, and you update the relevant package to the latest version, 
but now there are incompatibilities.

This is a way to manage dependencies in such a python project.
Create a `requirements.txt` file with the packages you need but not their dependencies.
The following script will generate a file `requirements-frozen.txt` with the specified packages and all their dependencies version pinned.
Commit both files to version management.
Add or remove packages from `requirements.txt` and use `requirements-frozen.txt` for reproducible builds.
To update all packages, re-run the script.

```
  #!/bin/sh
  docker run -v "$(pwd)":/req -w /req python:3.???.???-slim-buster \
  sh -c "pip install -r requirements.txt \
  && echo \"#$(date)\" > requirements-frozen.txt \
  && pip freeze >> requirements-frozen.txt"
```

The following is a line-by-line explanation of the script:

0. A [shebang](https://en.wikipedia.org/wiki/Shebang_%28Unix%29) signifies the script should be run in the `sh` shell
1. Create an ephemeral python container with access to the current directory as its working directory.
2. Within this container, start a subshell to execute three commands, the first of which being to install the
   requirements in `requirements.txt`
3. Echo the current date into `requirements-frozen.txt`
4. Append the output of `pip freeze` to `requirements-frozen.txt`

### Benefits

* The output file is human-readable and can be easily diff-ed, since `pip freeze` automatically sorts output by name.
* No abstraction or magic to learn and trust
* Updating after a patch is released is as simple as re-running the script.

If you want features, try [pipenv](https://pipenv.pypa.io/) or [Poetry](https://python-poetry.org/).
