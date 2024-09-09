#import "../utils/dictionary-lookup.typ" : rtk, rtk_exists
#let generate_rtk_overview(sentence) = {
  [= Rtk overview]
  block(height: 5pt)

  let rtks = ()
  for c in sentence.codepoints() {
    if rtk_exists(c) {
      let k = rtk(c)
      let s = c + " - " + k
      rtks.push(text(weight: "bold", s))
    }
  }

  grid(columns: 3, gutter: 20pt,
  ..rtks)

}