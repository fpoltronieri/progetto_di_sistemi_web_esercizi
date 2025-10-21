module Shout
  refine String do
    def shout
      upcase + '!'
    end
  end
end

class Thing
  using Shout
  def to_s
    'hello'.shout # => "HELLO!"
  end
end

puts Thing.new

using Shout

puts 'hello'.shout # => "HELLO!  re"
