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
end

class Other < Thing
  'hello'.shout # => ????
  # Refinements are NOT inherited by subclasses
end
