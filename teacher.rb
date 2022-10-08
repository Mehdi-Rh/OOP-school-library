# Create class Teacher with the following:
# Inherits from Person.
# Constructor extends parent's constructor by adding @specialization and a parameter for it.
# Override can_use_services? so it always returns true.
require './person'

class Teacher < Person
  attr_accessor :name, :age, :parent_permission

  def initialize(specialization, age, name, parent_permission = 'true')
    super(age, name, parent_permission, rentals)
    @specialization = specialization
  end

  def can_use_services?
    true
  end
end
