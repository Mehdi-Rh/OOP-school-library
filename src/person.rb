class Person
  def initialize(age, name = 'Unknown', parent_permission: false)
    @id = Time.now.to_i
    @name = name
    @age = age
    @parent_permission = parent_permission
  end

  attr_accessor :name, :age
  attr_reader :id

  def of_age?
    @age >= 40
  end

  def can_use_services?
    of_age? || @parent_permission
  end
end
