#let p = plugin("./target/wasm32-unknown-unknown/release/hello.wasm");

#let sentence = "動かない";
#let morphemes = str(p.get_morphemes(bytes(sentence))).split("|");


= #sentence but normalized into morphemes
#line(length: 100%)

#for morpheme in morphemes {
  [+ #morpheme \ ]
}