#let jmdict(key) = {
  return json("../jmdict-simple-lookup.json").at(key, default: "")
}

#let jmdict_exists(key) = {
    let dictionary_lookup = json("../jmdict-simple-lookup.json").at(key, default: ())
    return dictionary_lookup.len() > 0
}

#let rtk(key) = {
  return json("../rtk-simple-lookup.json").at(key, default: "")
}

#let rtk_exists(key) = {
    let dictionary_lookup = json("../rtk-simple-lookup.json").at(key, default: ())
    return dictionary_lookup.len() > 0
}