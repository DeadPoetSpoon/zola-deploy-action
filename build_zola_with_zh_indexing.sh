#!/bin/bash
rustup update
cd /rust/zola
git config --global --add safe.directory /rust/zola
git pull
cargo b --release --features indexing-zh
cd target/release
tar_file="zola-indexing-zh-x86_64-unknown-linux-gnu.tar.gz"
if [  -f "$tar_file" ]; then
  rm "$tar_file"
fi
tar -zcvf zola-indexing-zh-x86_64-unknown-linux-gnu.tar.gz zola
