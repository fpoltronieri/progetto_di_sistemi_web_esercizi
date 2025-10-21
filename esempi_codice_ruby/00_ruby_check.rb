def method(a: 1, b: 2, **args)
  puts "a: #{a}"
  puts "b: #{b}"
  puts "args: #{args}"
end

method(a: 3, b: 4, c: 5, d: 6)
h = { a: 3, b: 4, c: 5, d: 6 }
method(**h)
