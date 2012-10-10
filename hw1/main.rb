def palindrome?(string)
  string = string.
    downcase.
    # \W matches any non-word character
    # \d matches any digit
    gsub(/(\W|\d)/, "")

  true ? string.eql?(string.reverse) : false
end

def count_words(string)
  words = string.
    # Split at any word boundary
    split(/\b/).
    each {|word|
      word.gsub!(/(\W|\d)/, "")
      word.strip!
      word.downcase!
    }
  freq = words.inject(Hash.new(0)) { |h,v| h[v] += 1; h }
  freq.delete("")
  return freq
end

#puts palindrome?("A man, a plan, a canal -- Panama")
#puts palindrome?("Madam, I'm Adam!")
#puts palindrome?("Abracadabra")
#puts count_words("A man, a plan, a canal -- Panama")
#puts count_words "Doo bee doo bee doo"
