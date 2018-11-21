# crython

Crystal meets Python!
Experiment on how a Python interpreter can be embedded in Crystal.

Current status: PoC

## Installation

A Python interpreter is required as a dependency.
Ensure `python-config --ldflags` works.

Since Python's C API expose some constants or functions using preprocessor macros, `crython` uses a thin *static* library written in C (see `src/ext/crython.c`) that re-exports them with a fixed C API.

Use `make` with the optional variables `release=1` or `debug=1` to build the static library. Note that `make release=1` is automatically executed by `shards` as a postinstall script.

Add this to your application's `shard.yml`:

```yaml
dependencies:
  crython:
    github: rumenzu/crython
```

## Usage

```crystal
require "crython"
```

See `examples` folder.
Use `make examples` with the optional make variables `release=1` or `debug=1` to build all examples.

## Development

TODO: Write development instructions here

## Contributing

1. Fork it (<https://github.com/rumenzu/crython/fork>)
2. Create your feature branch (`git checkout -b my-new-feature`)
3. Commit your changes (`git commit -am 'Add some feature'`)
4. Push to the branch (`git push origin my-new-feature`)
5. Create a new Pull Request

## Contributors

- [rumenzu](https://github.com/rumenzu) Romain Franceschini - creator, maintainer
