require './person'
require './book'

class Rental
  attr_accessor :date
  attr_reader :person, :book

  def initialize(date, person, book)
    @date = date

    @person = person

    @book = book
  end

  def person=(person)
    @person = person
    @person.rentals.push(self) unless @person.rentals.include?(self)
  end

  def book=(book)
    @book = book
    @book.rentals.push(self) unless @book.rentals.include?(self)
  end

  def to_hash
    hash = {}
    hash[:date] = @date
    hash[:person_id] = @person.id
    hash[:book_id] = @book.id
    hash
  end
end

# def add_student
#   age = 30
#   name = "Mehdi"
#   student = Student.new(age, name,false)
#   puts student.inspect
#   return student
# end

# def add_book
#   book = Book.new("titanic", 'mehdi')
#   puts book.inspect
#   return book
# end

# student = add_student
# book = add_book
