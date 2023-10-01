Sgoettschkes/exercism
=====================

A repository to solve [exercism](https://exercism.org/) exercises.

Check out my [profile page](https://exercism.org/profiles/Sgoettschkes)!

# Local setup

In order to solve exercism exercises, test the code and run the linter used for the particular language, make sure you follow the steps below.

We'll be using [asdf](https://asdf-vm.com/) if not indicated otherwise.

## Dart

Add the [dart](https://github.com/PatOConnor43/asdf-dart) plugin: `asdf plugin-add dart https://github.com/patoconnor43/asdf-dart.git`

Run `asdf install dart` in the root folder.

## Elixir

Add the [erlang](https://github.com/asdf-vm/asdf-erlang) plugin: `asdf plugin add erlang https://github.com/asdf-vm/asdf-erlang.git`

Add the [elixir](https://github.com/asdf-vm/asdf-elixir) plugin: `asdf plugin-add elixir https://github.com/asdf-vm/asdf-elixir.git`

Run `asdf install erlang && asdf install elixir` in the root folder.

## Gleam

Add the [erlang](https://github.com/asdf-vm/asdf-erlang) plugin: `asdf plugin add erlang https://github.com/asdf-vm/asdf-erlang.git`

Add the [Gleam](https://github.com/asdf-community/asdf-gleam) plugin: `asdf plugin-add gleam https://github.com/asdf-community/asdf-gleam.git`

Run `asdf install erlang && asdf install gleam`

## Haskell

Install "The Haskell Tool Stack" according to https://docs.haskellstack.org/en/stable/install_and_upgrade/. For macOS, use brew:`brew install haskell-stack`

For linting, you'll also need hlint: `stack install hlint`. hlint is installed to `~/.local/bin` and you'll need to put it into your path for the `haskell-tests.sh` script to work.

## Lua

Add the [lua](https://github.com/Stratus3D/asdf-lua) plugin, install lua, and install busted for testing and luacheck for linting, using luarocks.

```shell
asdf plugin-add lua https://github.com/Stratus3D/asdf-lua.git
asdf install lua
luarocks install busted && luarocks install luacheck
asdf reshim lua
```

## NodeJS (for Javascript)

Add the [nodejs](https://github.com/asdf-vm/asdf-nodejs) plugin: `asdf plugin add nodejs https://github.com/asdf-vm/asdf-nodejs.git`

Run `asdf install nodejs` in the root folder.

## Rust

Add the [rust](https://github.com/asdf-community/asdf-rust) plugin: `asdf plugin-add rust https://github.com/asdf-community/asdf-rust.git`.

Run `asdf install rust` in the root folder.
