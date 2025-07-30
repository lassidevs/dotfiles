## Important stuff regarding nvim plugins

I.E. if your shit is breaking, this might help...

### Rust-analyzer causing issues when editing a new empty file

> Error message is around the lines of "invalid offset linecol"...

#### FIX

This seems to be caused by Mason installing an old version of rust-analyzer on your machine.
The fix is to delete the rust-analyzer Mason has installed, and use a newer version from rustup

```sh
~/.local/share/nvim/mason/bin/rust-analyzer --version
```

If this outputs an older version, proceed with the following:

1. download newest rust-analyzer version

```sh
rustup component add rust-analyzer
```

above command will install rust-analyzer to ~/.cargo/bin/rust-analyzer

2. Remove Mason downloaded rust-analyzer version

```sh
rm ~/.local/share/nvim/mason/bin/rust-analyzer
```

3. Create a symlink to new rustup version

```sh
ln -s ~/.cargo/bin/rust-analyzer ~/.local/share/nvim/mason/bin/rust-analyzer
```

DONE! 🥳
Note that this is likely needed every time after updating rust-analyzer through Mason, so a shell command could be nice.
