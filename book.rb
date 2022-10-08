require './rental'

class Book
  attr_accessor :rentals, :id, :title, :author

  def initialize(title, author)
    @id = Random.rand(1..1000)
    @title = title
    @author = author
    @rentals = []
  end

  def add_rental(rental)
    @rentals.push(rental) unless @rentals.include?(rental)
    rental.book = self
  end
end

# book = Book.new("titanic", 'mehdi')
# puts book.author
# puts book.rentals
