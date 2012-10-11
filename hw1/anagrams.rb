def combine_anagrams(words)
  hash = {}
  anagrams = []

  words.each do |word|
    sorted = word.downcase.each_char.sort.join
    if hash.has_key? sorted
      hash[sorted].push word
    else
      hash[sorted] = Array.new.push word
    end
  end

  hash.each_value do |value|
    anagrams.push value
  end

  return anagrams
end
