Sgoettschkes/exercism
=====================

A repository to solve [exercism](https://exercism.org/) exercises.

Check out my [profile page](https://exercism.org/profiles/Sgoettschkes)!

# Local setup

In order to solve exercism exercises, test the code and run the linter used for the particular language, make sure you follow the steps below.

We'll be using `asdf` if not indicated otherwise.

## Dart

Add the [dart](https://github.com/PatOConnor43/asdf-dart) plugin: `asdf plugin-add dart https://github.com/patoconnor43/asdf-dart.git`

Run `asdf install` in the root folder.

## Elixir

Add the [erlang](https://github.com/asdf-vm/asdf-erlang) plugin: `asdf plugin add erlang https://github.com/asdf-vm/asdf-erlang.git`

Add the [elixir](https://github.com/asdf-vm/asdf-elixir) plugin: `asdf plugin-add elixir https://github.com/asdf-vm/asdf-elixir.git`

Run `asdf install` in the root folder.

## Haskell

Install "The Haskell Tool Stack" according to https://docs.haskellstack.org/en/stable/install_and_upgrade/. For macOS, use brew:`brew install haskell-stack`

For linting, you'll also need hlint: `stack install hlint`. hlint is installed to `~/.local/bin` and you'll need to put it into your path for the `haskell-tests.sh` script to work.

## Javascript

Install node according to https://nodejs.org/en/download/. For macOS, use brew: `brew install node`

## Lua

Install lua and luarocks according to https://www.lua.org/download.html and https://github.com/luarocks/luarocks/wiki/Download. For macOS, use brew: `brew install lua luarocks`

Install busted for testing and luacheck for linting, using luarocks: `luarocks install busted && luarocks install luacheck`

## Rust

Add the [rust](https://github.com/asdf-community/asdf-rust) plugin: `asdf plugin-add rust https://github.com/asdf-community/asdf-rust.git`

Run `asdf install` in the root folder.
