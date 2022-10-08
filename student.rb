require './person'

class Student < Person
  attr_accessor :name, :age
  attr_reader :classroom

  # rubocop:todo Style/OptionalBooleanParameter
  def initialize(age, name, parent_permission = true)
    # rubocop:enable Style/OptionalBooleanParameter

    super(age, name, parent_permission)
    @classroom = classroom
    @statut = 'Student'
  end

  def add_classroom(_classroom)
    @classroom.students.push(self) unless @classroom.students.include?(self)
  end

  def play_hooky
    "¯\(ツ)/¯"
  end
end

# puts Student.instance_method(:initialize).parameters
# puts Student.instance_method(:initialize).parameters.map(&:last).map(&:to_s)

# age = 30
# puts "Age: #{age}"

# name = "Mehdi"
# puts "Name: #{name}"
# student = Student.new(age, name,false, 10)

# puts student.age
# puts student.name
# puts student.parent_permission

# puts student.inspect
