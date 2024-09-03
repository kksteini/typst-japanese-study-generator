#import "../utils/dictionary-lookup.typ" : rtk, rtk_exists
#let generate_rtk_overview(sentence) = {
  block(height: 15pt)
  [= Rtk overview]

  grid(columns: 3)[
    #for c in sentence.codepoints() {
      if rtk_exists(c) {
        let k = rtk(c)
        let s = c + " - " + k
        [#text(weight: "bold", s)]
      }
    }
  ]

}