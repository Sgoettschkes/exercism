Sgoettschkes/exercism
=====================

A repository to solve [exercism](https://exercism.org/) exercises.

Check out my [profile page](https://exercism.org/profiles/Sgoettschkes)!

# Local setup

In order to solve exercism exercises, test the code and run the linter used for the particular language, make sure you follow the steps below.

We'll be using [asdf](https://asdf-vm.com/) if not indicated otherwise.

## Clojure

Install rlwrap and java runtime:

`brew install java rlwrap`

Add the [clojure](https://github.com/asdf-community/asdf-clojure) plugin: `asdf plugin add clojure https://github.com/asdf-community/asdf-clojure.git`.

Run `asdf install clojure` in the root folder.

## C++

Add the [cmake](https://github.com/asdf-community/asdf-cmake) plugin: `asdf plugin add cmake https://github.com/asdf-community/asdf-cmake.git`.

Run `asdf install cmake` in the root folder.

## Dart

Add the [dart](https://github.com/PatOConnor43/asdf-dart) plugin: `asdf plugin-add dart https://github.com/patoconnor43/asdf-dart.git`.

Run `asdf install dart` in the root folder.

## Elixir

Install [Erlang](#Erlang).

Add the [elixir](https://github.com/asdf-vm/asdf-elixir) plugin: `asdf plugin-add elixir https://github.com/asdf-vm/asdf-elixir.git`.

Run `asdf install elixir` in the root folder.

## Erlang

Add the [erlang](https://github.com/asdf-vm/asdf-erlang) plugin: `asdf plugin add erlang https://github.com/asdf-vm/asdf-erlang.git`.

Run `asdf install erlang` in the root folder.

## Gleam

Add the [erlang](https://github.com/asdf-vm/asdf-erlang) plugin: `asdf plugin add erlang https://github.com/asdf-vm/asdf-erlang.git`.

Add the [rebar](https://github.com/Stratus3D/asdf-rebar) plugin: `asdf plugin-add rebar https://github.com/Stratus3D/asdf-rebar.git`.

Add the [Gleam](https://github.com/asdf-community/asdf-gleam) plugin: `asdf plugin-add gleam https://github.com/asdf-community/asdf-gleam.git`.

Run `asdf install erlang && asdf install rebar && asdf install gleam` in the root folder.

## Haskell

Add the [Haskell](https://github.com/asdf-community/asdf-haskell) plugin: `asdf plugin-add haskell https://github.com/vic/asdf-haskell.git`.

Run `asdf install haskell` in the root folder.

For linting, you'll also need hlint: `stack install hlint`. Don't forget to reshim: `asdf reshim haskell`.

# jq

Add the [jq](https://github.com/lsanwick/asdf-jq) plugin: `asdf plugin-add jq https://github.com/lsanwick/asdf-jq.git`.

For testing, the track uses bats. Add the [bats](https://github.com/timgluz/asdf-bats) plugin: `asdf plugin-add bats https://github.com/timgluz/asdf-bats.git`.

Run `asdf install jq && asdf install bats` in the root folder.

## Lua

Add the [lua](https://github.com/Stratus3D/asdf-lua) plugin, install lua, and install busted for testing and luacheck for linting, using luarocks.

```shell
asdf plugin-add lua https://github.com/Stratus3D/asdf-lua.git
asdf install lua
luarocks install busted && luarocks install luacheck
asdf reshim lua
```

## NodeJS (for Javascript)

Add the [nodejs](https://github.com/asdf-vm/asdf-nodejs) plugin: `asdf plugin add nodejs https://github.com/asdf-vm/asdf-nodejs.git`.

Run `asdf install nodejs` in the root folder.

## Python

Add the [Pthon](https://github.com/asdf-community/asdf-python) plugin: `asdf plugin add pthon https://github.com/asdf-community/asdf-python`.

Run `asdf install python` in the root folder.

Install pytest and pylint: `pip install pylint pytest`

## Rust

Add the [rust](https://github.com/asdf-community/asdf-rust) plugin: `asdf plugin-add rust https://github.com/asdf-community/asdf-rust.git`.

Run `asdf install rust` in the root folder.

## Zig

Add the [zig](https://github.com/asdf-community/asdf-zig) plugin: `asdf plugin-add zig https://github.com/asdf-community/asdf-zig.git`.

Run `asdf install zig` in the root folder.

