class Numeric
  @@currencies = {'yen' => 0.013, 'euro' => 1.292, 'rupee' => 0.019, 'dollar' => 1.0}
  def method_missing(method_id, *args)
    singular_currency = method_id.to_s.
      # Remove trailing 's'
      gsub( /s$/, '')
    if @@currencies.has_key?(singular_currency)
      self * @@currencies[singular_currency]
    else
      super
    end
  end

  def in(currency)
    singular_currency = currency.to_s.gsub(/s$/, '')
    self / @@currencies[singular_currency]
  end
end

class String
  def palindrome?
    clean_string = self.downcase.gsub(/\W/, '')
    return clean_string == clean_string.reverse
  end
end

module Enumerable
  def palindrome?
    self.entries.respond_to?(:reverse) ? self.entries == self.entries.reverse : false
  end
end
