use core::str;

use lindera::{DictionaryConfig, DictionaryKind, Mode, Tokenizer, TokenizerConfig};
use wasm_minimal_protocol::*;

initiate_protocol!();

#[wasm_func]
pub fn get_morphemes(arg1: &[u8]) -> Vec<u8> {
    let s = str::from_utf8(arg1).unwrap();
    let dictionary = DictionaryConfig {
        kind: Some(DictionaryKind::IPADIC),
        path: None,
    };

    let config = TokenizerConfig {
        dictionary,
        user_dictionary: None,
        mode: Mode::Normal,
    };

    // create tokenizer
    let tokenizer = Tokenizer::from_config(config).unwrap();

    // tokenize the text
    let mut tokens = tokenizer.tokenize(s).unwrap();

    // output the tokens
    //for token in tokens {
    //    println!("{}", token.text);
    //}
    let f = tokens
        .iter_mut()
        .map(|t| t.get_details().unwrap().get(6).unwrap().to_owned())
        .collect::<Vec<&str>>();

    f.join("|").into_bytes()
}
