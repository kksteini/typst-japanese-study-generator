#import "typst-utils/dictionary-lookup.typ" : jmdict, jmdict_exists


#let sentence = "私の車はディーゼル燃料で動きます。".codepoints()

// Iterate over vocabulary
#let start = 0
#let end = sentence.len()

#while start < sentence.len() - 1 {
  while end > start {
    let fragment = sentence.slice(start, end).join()

    if jmdict_exists(fragment) {
      [#jmdict(fragment)]
      start = end - 1
      end = sentence.len()
      break
    }
    end -= 1
  }
  start += 1
}

