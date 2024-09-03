require 'json'

remain = Dir.new("./rtk/remain")

records = {}

remain.each_child do |child|
    lines = File.open("./rtk/remain/#{child}").readlines.collect{|v| v.chomp}

    record = {}

    lines.each do |line|
        if line.start_with? "kanji: " then
            record[:kanji] = line.split("kanji: ")[1].strip
        elsif line.start_with? "keyword: " then
            record[:keyword] = line.split("keyword: ")[1].strip
        end
    end
    

    if record[:kanji].include? "・" then
        kanjis = record[:kanji].split("・").collect{|v| v.strip}

        kanjis.each do |kanji|
            records[kanji] = record[:keyword]
        end
    else
        records[record[:kanji]] = record[:keyword]
    end
end

v6 = Dir.new("./rtk/v6")
v6.each_child do |child|
    lines = File.open("./rtk/v6/#{child}").readlines.collect{|v| v.chomp}

    record = {}

    lines.each do |line|
        if line.start_with? "kanji: " then
            record[:kanji] = line.split("kanji: ")[1].strip
        elsif line.start_with? "keyword: " then
            record[:keyword] = line.split("keyword: ")[1].strip
        end
    end
    
    if record[:kanji].include? "・" then
        kanjis = record[:kanji].split("・").collect{|v| v.strip}

        kanjis.each do |kanji|
            records[kanji] = record[:keyword]
        end
    else
        records[record[:kanji]] = record[:keyword]
    end
end

File.write('rtk-simple-lookup.json', JSON.pretty_generate(records))