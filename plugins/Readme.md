# What is this wasm file?

A very hacky way to interact with the lindera analyzer wrapped/compiled into its WASM plugin form for typst.
You can root around in the folder /morphemizer/morphemizer/ to see what the code is doing, especially /src/lib.rs.

The Readme in the /morphemizer/morphemizer is unchanged. I did remove the examples but you can find this code online [here](https://github.com/astrale-sharp/wasm-minimal-protocol)

Once in /morphemizer/morphemizer you can simply build a wasm for yourself using:

    cargo build --release --target wasm32-unknown-unknown
    cp ./target/wasm32-unknown-unknown/release/hello.wasm ./morphemizer.wasm
