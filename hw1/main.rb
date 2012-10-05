def palindrome?(string)
  string = string.
    downcase.
    # \W matches any non-word character
    # \d matches any digit
    gsub(/(\W|\d)/, "")

  true ? string.eql?(string.reverse) : false
end

puts palindrome?("A man, a plan, a canal -- Panama")
puts palindrome?("Madam, I'm Adam!")
puts palindrome?("Abracadabra")
