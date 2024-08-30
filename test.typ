#let jmdict(key) = {
  let bango = json("jmdict-simple-lookup.json").at(key)
  [#key (#bango.at("kana")): #bango.at("meaning")]
}

= Hello
How are you doing?

#jmdict("何") \
#jmdict("言う") \
#jmdict("する")

