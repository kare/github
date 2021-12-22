# Reusable workflows for GitHub Actions

## Usage
```
---
name: CI
on:
  push:
    branches:
      - main
  pull_request:
    branches:
      - main
jobs:
  ci:
    uses: kare/github/.github/workflows/go-pkg-ci.yaml@v0.2.0
```