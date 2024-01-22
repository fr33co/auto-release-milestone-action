# Auto release milestone

A Github action that automatically drafts a Github release bases on a newly closed milestone.

The issues that were closed as part of the milestone will be used as the bases to generate the release notes.

## Inputs

### `repo-token`

**Required** The `GITHUB_TOKEN` used to access the current repository through the `Github REST API`

## Outputs

### `release-url`

The URL of the Github release that was drafted. Defaults to an empy string

## Usage

Here's an example of a workflow that listens for the `milestone: closed` event and automatically creates a releases draft with the issues that were closed as release notes. It also prints the URL of the release page to the build log 

```yaml
name: Test

on:
  push:
    branches:
      - main
  milestone:
    types: [closed]

jobs:
  test:
    name: test
    runs-on: ubuntu-latest
    steps:
      - name: Get the sources
        uses: actions/checkout@v2
      - name: Create a release draft for a milestone
        id: create-release-draft
        uses: ./
        with:
          token: ${{ secrets.GITHUB_TOKEN }}
      - name: Print the URL of the release draft
        if: steps.create-release-draft.outputs.release-url != ''
        run: echo ${{ steps.create-release-draft.outputs.release-url }}
```