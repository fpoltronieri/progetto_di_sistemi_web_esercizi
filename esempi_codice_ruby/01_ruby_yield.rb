class Employee
  attr_reader :name, :age, :occupation

  def initialize(name, age, occupation)
    @name = name
    @age = age
    @occupation = occupation
  end
end

class Organization
  def initialize(employees)
    @employees = employees
  end

  def list_employees
    for e in @employees
      yield(e.name, e.age, e.occupation)
    end
  end
end

filippo = Employee.new('Filippo', '33', 'Ricercatore')
unife = Organization.new([filippo])

unife.list_employees do |x, y, z|
  puts "#{x} - #{z}"
end
