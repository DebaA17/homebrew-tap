<h1 align="center">🍺 My Homebrew Tap</h1>

<p align="center">
  <strong>Custom Homebrew formulae for macOS and Linux</strong>
</p>

<p align="center">
  This repository is a Homebrew tap maintained by me to easily distribute and update my command-line tools.
</p>

---

## Add and Trust the Tap

Starting with **Homebrew 6.0.0+**, third-party taps are not trusted by default because they can run arbitrary Ruby code. You must explicitly trust the tap (or a specific formula) before evaluating or installing from it.

### Option A: Trust the entire tap (Recommended for convenience)

```bash
brew tap DebaA17/tap
brew trust DebaA17/tap
```

### Option B: Trust specific formulae (Recommended for safety)

If you only want to trust specific tools from this tap:

```bash
brew tap DebaA17/tap
brew trust --formula DebaA17/tap/<formula>

# Example:
brew trust --formula DebaA17/tap/cvecli
```

## Install a tool

Once the tap/formula is trusted, install the tool:

```bash
brew install <formula>
```

Examples:

```bash
brew install cvecli
```

## Upgrade

```bash
brew upgrade <formula>
# or
brew upgrade
```

## Uninstall

```bash
brew uninstall <formula>
```

## What’s in this repo

- `Formula/`: Ruby formulae used by Homebrew.

## Support

If a formula corresponds to a GitHub project, issues are typically tracked in that project’s repository.
