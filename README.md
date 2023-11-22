# Smallest Rust Binary

> Yeah, you heard it right. Only 16Kb in Linux and 30Kb in and with Docker Container

## Build (GNU/Linux, Windows, MacOS)

Make sure you have [installed rust](https://www.rust-lang.org/tools/install) and you need to install the nightly toolchain.
You also have to install [upx](https://upx.github.io/) to compress the final executible. 

- Check your host os:
  ```sh
  rustc -vV
  ```
  The host will be your host os.

- Install the nigtly toolchain for your host os:
  ```sh
  rustup toolchain install nightly && rustup component add rust-src --toolchain nightly  
  ```
- Build:
  ```sh
  cargo +nightly build -Z build-std=std,panic_abort -Z build-std-features=panic_immediate_abort \
      --target <host-os> --release
  ```
  (Replace <host-os> with your host os found in the previous step. e.g. for linux, it can be: x86_64-unknown-linux-gnu)

- Compress the executible using upx
  ```sh
  upx --best --lzma target/<host-os>/release/hello-world
  ```
  (Replace <host-os> with your host os found in the previous step. e.g. for linux, it can be: x86_64-unknown-linux-gnu)

- Check the size of the executible
  **(Linux/MacOS)**
  ```sh
  du -h target/<host-os>/release/hello-world
  ```
  (Replace <host-os> with your host os found in the previous step. e.g. for linux, it can be: x86_64-unknown-linux-gnu)

  **(Windows)**
  ```sh
  dir -h target/<host-os>/release/hello-world
  ```
  (Replace <host-os> with your host os found in the previous step. e.g. for linux, it can be: x86_64-unknown-linux-gnu)

- Run the executible
  ```sh
  ./target/<host-os>/release/hellow-world
  ```
  (Replace <host-os> with your host os found in the previous step. e.g. for linux, it can be: x86_64-unknown-linux-gnu)

- Congratulations. You just built the smallest binary possible without using dynanic link library and without losing libstd library and essential rust features. 

## Build (Docker)

- Install [Docker](https://docs.docker.com/get-docker/)
- Run
  ```sh
  docker compose up
  ```
