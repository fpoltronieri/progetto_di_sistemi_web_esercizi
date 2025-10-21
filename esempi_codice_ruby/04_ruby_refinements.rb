# Let's check this thing
#
module Shouting
  refine String do
    def shout
      upcase + '!'
    end
  end
end

class Thing
  using Shouting
  def greet
    'hi'.shout
  end
end

puts Thing.new.greet # => "HI!"
