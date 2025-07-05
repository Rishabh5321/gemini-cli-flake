# gemini-cli Flake

[![NixOS](https://img.shields.io/badge/NixOS-supported-blue.svg)](https://nixos.org)
[![License: MIT](https://img.shields.io/badge/License-MIT-green.svg)](LICENSE)
[![flake_check](https://github.com/Rishabh5321/gemini-cli-flake/actions/workflows/flake_build.yml/badge.svg)](https://github.com/Rishabh5321/gemini-cli-flake/actions/workflows/flake_build.yml)

This repository provides a Nix flake for gemini-cli.

## Table of Contents
1. [Features](#features)
2. [Installation](#installation)

   - [Using the Flake Directly](#using-the-flake-directly)

3. [Configuration](#configuration)
4. [License](#license)

---

## Features
- **Pre-built gemini-cli Package**: The flake provides a dev gemini-cli package for `x86_64-linux`.

The packages in this flake features

`gemini-cli-stable` = currently it is only nix version

`gemini-cli-nightly` = Dev version with `nightly` tag

`default` = nightly version

---

## Installation

### Using the Flake Directly
You can run gemini-cli directly using the flake without integrating it into your NixOS configuration:

```bash
nix run github:rishabh5321/gemini-cli-flake#default
```
### Using the Flake Profiles

You can install gemini-cli directly using the flake without integrating it into your NixOS configuration:
```bash
nix profile install github:rishabh5321/gemini-cli-flake#default
```

### Integrating with NixOS declaratively.

You can install this flake directly in declarative meathod.

1. Add the gemini-cli flake to your flake.nix inputs.
```nix
gemini-cli.url = "github:rishabh5321/gemini-cli-flake";
```
2. Import the gemini-cli module in your NixOS configuration:
```nix
{ inputs, ... }: {
   environment.systemPackages = [
     inputs.gemini-cli.packages.${pkgs.system}.default
   ];
}
```
3. Rebuild your system:
```bash
sudo nixos-rebuild switch --flake .#<your-hostname>
```
OR
```bash
nh os boot --hostname <your-hostname> <your-flake-dir>
```
4. Simply start the app using terminal:
```bash
gemini
```

### License
This flake is licensed under the MIT License.
