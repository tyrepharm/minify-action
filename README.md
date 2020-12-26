# Minify Action
[![GitHub release](https://img.shields.io/github/release/anthonyftwang/minify-action.svg?color=orange)](https://gitHub.com/tyrepharm/minify-action/releases/)

Github Action to minify js, css, and html files pushed to a branch, using the [Minify](https://github.com/coderaiser/minify) package.
### Usage
Here the target branch is `foo`. You need to checkout your repository so the Minify Action job can access it. Then, you can auto-commit the files to the repository if desired.
```yaml
name: Minify Workflow
on:
  push:
    branches: [ foo ]

jobs:
  build:
    runs-on: ubuntu-latest
    steps:
      # Checks-out your repository
      - uses: actions/checkout@v2
        with:
          ref: ${{ github.ref }}

      - name: Minify Action
        uses: tyrepharm/minify-action@v2

      # Auto-commit to repository
      - uses: stefanzweifel/git-auto-commit-action@v4
        with:
          commit_message: Minify source code
          branch: ${{ github.ref }}
```
