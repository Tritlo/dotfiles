#!/bin/bash
cat .nix-installed-pkgs | xargs nix-env --install -P
