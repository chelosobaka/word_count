def word_count(file)
  file = File.open(file, "r")

  array = Array.new
  hash = Hash.new

  file.each_line do |line|
    array << line.split(/[^[[:word:]]]+/)
  end

  array.flatten!

  array.each do |word|
    word.downcase!
    if hash.has_key?(word)
      hash[word] += 1
    else
      hash[word] = 1
    end
  end
  return hash
end

hash = word_count("some_text.txt")
hash.each do |key, value|
  puts key.to_s + "-" + value.to_s
end
