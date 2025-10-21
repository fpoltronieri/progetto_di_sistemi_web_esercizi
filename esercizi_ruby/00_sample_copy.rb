class Utils
  def self.deep_copy(obj)
    case obj
    when Hash
      obj.each_with_object({}) { |(k, v), h| h[deep_copy(k)] = deep_copy(v) }
    when Array
      obj.map { |v| deep_copy(v) }
    when String, Numeric, Symbol, TrueClass, FalseClass, NilClass
      obj
    else
      raise ArgumentError, "Unsupported type: #{obj.class}"
    end
  end

  def self.my_deep_copy(arr)
    Marshal.load(Marshal.dump(arr))
  end
end

a = [10, [20, 30], 40]
puts "#{a} #{a.object_id} #{a[1][0].object_id}"
b = Utils.my_deep_copy(a)
puts "#{b} #{b.object_id} #{b[1][0].object_id}"
