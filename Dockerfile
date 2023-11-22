FROM rust:alpine AS builder

RUN rustup target add x86_64-unknown-linux-musl
RUN rustup toolchain install nightly-x86_64-unknown-linux-musl
RUN rustup component add rust-src --toolchain nightly-x86_64-unknown-linux-musl
RUN apk add --no-cache musl-dev upx

WORKDIR /app
COPY . .
RUN cargo +nightly build -Z build-std=std,panic_abort -Z build-std-features=panic_immediate_abort \
    --target x86_64-unknown-linux-musl --release
RUN upx --best --lzma target/x86_64-unknown-linux-musl/release/hello-world-min


FROM scratch
COPY --from=builder /app/target/x86_64-unknown-linux-musl/release/hello-world-min .
CMD ["./hello-world-min"]
