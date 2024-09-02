#let jmdict(key) = {
  let dictionary_lookup = json("../jmdict-simple-lookup.json").at(key)


  [== #key \ ]
  for entry in dictionary_lookup {
      [- #entry.at("kana", default: "") -- #entry.at("meaning") \ ]
  }

}

#let jmdict_exists(key) = {
    let dictionary_lookup = json("../jmdict-simple-lookup.json").at(key, default: ())
    return dictionary_lookup.len() > 0
}