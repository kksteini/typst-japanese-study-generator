# To avoid shame
# I know this overwrites unnecessarily
# I'm too lazy to fix that (yet) but I will get to it
require 'json'

# Load the JSON file
json = JSON.parse(File.read('jmdict-eng-3.5.0.json'));

bingo = {}

json["words"].each do |word|
    meaning = word["sense"][0]["gloss"][0]["text"]
    kana = word["kana"][0]["text"]

    if word["kanji"].length.zero?
        if word["kana"].length.zero?
            next
        end

        bingo[kana] = {"meaning" => meaning}
    else
        kanji = word["kanji"][0]["text"]
        bingo[kanji] = {"meaning" => meaning, "kana" => kana}
        bingo[kana] = {"meaning" => meaning, "kanji" => kanji}
    end
end

File.write('jmdict-simple-lookup.json', JSON.pretty_generate(bingo))

