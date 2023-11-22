# Smallest Rust Binary

> Yeah, you heard it right. Only 16Kb in Linux and 30Kb in and with Docker Container

![image](https://github.com/sanjib-sen/smallest-rust-binary/assets/54777542/7741cc90-1512-48df-8950-85d6cf51ab2a)

![image](https://github.com/sanjib-sen/smallest-rust-binary/assets/54777542/850292ef-8861-408c-b03b-d7335b3568d7)


## Build (GNU/Linux, Windows, MacOS)

Make sure you have [installed rust](https://www.rust-lang.org/tools/install) and you need to install the nightly toolchain.
You must also install [upx](https://upx.github.io/) to compress the final executable. 

- Check your host os:
  ```sh
  rustc -vV
  ```
  The host will be your host os.

- Install the nightly toolchain for your host os:
  ```sh
  rustup toolchain install nightly && rustup component add rust-src --toolchain nightly  
  ```
- Build:
  ```sh
  cargo +nightly build -Z build-std=std,panic_abort -Z build-std-features=panic_immediate_abort \
      --target <host-os> --release
  ```
  (Replace \<host-os> with your host os found in the previous step. e.g. for linux, it can be: x86_64-unknown-linux-gnu)

- Compress the executable using upx
  ```sh
  upx --best --lzma target/<host-os>/release/hello-world
  ```
  (Replace \<host-os> with your host os found in the previous step. e.g. for linux, it can be: x86_64-unknown-linux-gnu)

- Check the size of the executable
  **(Linux/MacOS)**
  ```sh
  du -h target/<host-os>/release/hello-world
  ```
  (Replace \<host-os> with your host os found in the previous step. e.g. for linux, it can be: x86_64-unknown-linux-gnu)

  **(Windows)**
  ```sh
  dir -h target/<host-os>/release/hello-world
  ```
  (Replace \<host-os> with your host os found in the previous step. e.g. for linux, it can be: x86_64-unknown-linux-gnu)

- Run the executable
  ```sh
  ./target/<host-os>/release/hellow-world
  ```
  (Replace \<host-os> with your host os found in the previous step. e.g. for linux, it can be: x86_64-unknown-linux-gnu)

- Congratulations. You just built the smallest binary possible without using dynanic link library and without losing libstd and essential rust features. 

## Build (Docker)

- Install [Docker](https://docs.docker.com/get-docker/)
- Run
  ```sh
  docker compose up
  ```
- Check the size of the executable
  ```sh
  docker images smallest-rust-binary-bin:latest
  ```
