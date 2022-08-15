#!/usr/bin/env bash

# Check if user have npm or yarn installed
if ! command -v npm >/dev/null 2>&1; then
  echo "npm is not installed. Please install node & npm through your package manager before continuing."
  exit 1
fi

# Check if the user have cargo installed
if ! command -v cargo >/dev/null 2>&1; then
  echo "cargo is not installed. Please install rust & cargo through your package manager before continuing."
  exit 1
fi

mkdir $HOME/.config/nvim
cp -r ./config/* $HOME/.config/nvim
