module Shouting
  refine String do
    def shout
      upcase + '!!!'
    end
  end
end

class Thing
  using Shouting
  'hello'.shout # => "HELLO!!!"
end

puts 'goodbye'.shout # => NoMethodError

# Refinements are activated in current scope with `using`
#
#
