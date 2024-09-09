#let dictionary = json("../jmdict-simple-lookup.json")
#let rtk_dictionary = json("../rtk-simple-lookup.json")

#let jmdict(key) = {
  return dictionary.at(key, default: "")
}

#let jmdict_exists(key) = {
    let dictionary_lookup = dictionary.at(key, default: ())
    return dictionary_lookup.len() > 0
}

#let rtk(key) = {
  return rtk_dictionary.at(key, default: "")
}

#let rtk_exists(key) = {
    let dictionary_lookup = rtk_dictionary.at(key, default: ())
    return dictionary_lookup.len() > 0
}