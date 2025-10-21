# Patching is very easy to implement.
#
# However, it is risky since modifications are global.
# It's a very common practive though, especially in tests.
#
class String
  def shout
    upcase + '!!!'
  end
end

puts 'hello'.shout # Outputs: HELLO!!!

# Refinements are a safer way to patch classes.
# Refinements are better for modular and complex applications, where isolation is important.
