# ingcreators Homebrew Tap

Homebrew formulae for [ingcreators](https://github.com/ingcreators) tools.

## Install

```sh
brew install ingcreators/tap/tesseraql
```

Or add the tap first:

```sh
brew tap ingcreators/tap
brew install tesseraql
```

## Formulae

| Formula | Description |
|---|---|
| `tesseraql` | CLI for [TesseraQL](https://ingcreators.com/tesseraql), the SQL-first hypermedia application framework. Installs the portable jar distribution on Homebrew's OpenJDK. |

## Updating

Formulae track the [GitHub releases](https://github.com/ingcreators/tesseraql/releases).
On a new release, bump `url`/`sha256` in the formula (the sha256 is the
asset digest shown by `gh release view <tag> --json assets`).
