remain = Dir.new("./rtk/remain")
remain.each_child do |child|
    x = File.open("./rtk/remain/#{child}").readlines.collect{|v| v.chomp}
end