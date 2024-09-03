#import "../utils/dictionary-lookup.typ" : jmdict, jmdict_exists
#let morphemiser = plugin("../plugins/morphemizer.wasm")

#let generate_vocabulary(sentence) = {
  let morphemes = str(morphemiser.get_morphemes(bytes(sentence))).split("|").dedup()

  [= Normalized vocabulary]

  [#par(sentence)]

  for morpheme in morphemes {
      if jmdict_exists(morpheme) {
        [== #morpheme]

        let dictionary_entries = jmdict(morpheme)
        let meanings = dictionary_entries.map(entry => {
            if "kanji" in entry.keys() {
              [#entry.kanji (#entry.kana) - #entry.meaning]
            } else if "kana" in entry.keys() {
              if entry.kana.trim() != morpheme.trim() {
                [#entry.kana - #entry.meaning]
              } else {
                [#entry.meaning]
              }
            } else {
              [#morpheme - #entry.meaning]
            }
        })

        block(width: 90%,
          grid(columns: (1fr, 1fr, 1fr), gutter: (5pt), ..meanings)
        )
      }
  }
}