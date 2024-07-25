# Zola Deploy Action
Github action for building a Zola site and deploying to Github Pages By BUILDING Zola with features, or use pre-build Zola.


Based on [shalzz/zola-deploy-action](https://github.com/shalzz/zola-deploy-action "Thx")

# Environment Variables (Additional)
* `ZOLA_BUILD_FEATURES`: Features will be used when building Zola. DO NOT set `PREBUILD_FEATURES`.
* `PREBUILD_FEATURES`: Use PRE build Zola from my obs. Only `indexing-zh` available for now.

# Example workflows

Using pre-build Zola
```
name: Pre Build Test

on:
 push:
  branches:
   - main

jobs:
  build:
    name: Build site
    runs-on: ubuntu-latest
    steps:
    - name: Checkout main
      uses: actions/checkout@v4
    - name: Build
      uses: DeadPoetSpoon/zola-deploy-action@v0.12
      env:
        PREBUILD_FEATURES: indexing-zh
        BUILD_DIR: test-site
        GITHUB_TOKEN: ${{ secrets.GITHUB_TOKEN }}
```

By building Zola with features
```
name: Build Test With Features

on:
 push:
  branches:
   - main

jobs:
  build:
    name: Build site
    runs-on: ubuntu-latest
    steps:
    - name: Checkout main
      uses: actions/checkout@v4
    - name: Build
      uses: DeadPoetSpoon/zola-deploy-action@v0.12
      env:
        ZOLA_BUILD_FEATURES: indexing-zh
        BUILD_DIR: test-site
        GITHUB_TOKEN: ${{ secrets.GITHUB_TOKEN }}
```
