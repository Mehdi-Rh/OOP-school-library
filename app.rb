require './nameable'
require './person'
require './student'
require './teacher'
require './classroom'
require './rental'
require './book'

module App
  def initialize
    @book_list = [
      Book.new('Titanic', 'S.Speelburg'),
      Book.new('Jaws', 'S.Speelburg')
    ]
    @people_list = [
      Student.new(18, 'Mehdi'),
      Student.new(20, 'Amine', false)
    ]
    @rental_list = []
  end

  def display_books
    puts ' There is no book in the list, please add some books' if @book_list.length.zero?
    @book_list.each do |book|
      puts "ID: #{book.id}, Title: #{book.title}, Author: #{book.author} "
      puts book.inspect
    end
    sleep(1)
  end

  def display_people
    puts ' There is no person in the list, please add some persons' if @people_list.length.zero?
    @people_list.each do |person|
      puts "ID: #{person.id}, Name: #{person.name}, Age: #{person.age}"
      puts person.inspect
    end
    sleep(1)
  end

  def display_rentals
    @people_list.each { |item| puts "ID: #{item.id}, Name: #{item.name}" }

    puts 'Please select the person ID'

    id = gets.chomp

    person = @people_list.select { |item| item.id == id }

    puts person.rentals.to_s
    sleep(1)
  end

  def add_person(option)
    option == '1' ? add_student : add_teacher
    puts 'Person added successfuly'
    sleep(1)
  end

  def add_student
    print 'Age: '
    age = gets.chomp.to_i

    print 'Name: '
    name = gets.chomp

    print 'Has parent permission? [Y/N]:'
    parent_permission_input = gets.chomp
    parent_permission = parent_permission_input == 'y'

    student = Student.new(age, name, parent_permission)
    @people_list << student
  end

  def add_teacher
    puts 'Age: '
    age = gets.chomp.to_i

    puts 'Name: '
    name = gets.chomp

    puts 'Specialization: '
    specialization = gets.chomp

    teacher = Teacher.new(specialization, age, name)
    @people_list << teacher
  end

  def add_book
    puts 'Title: '
    title = gets.chomp

    puts 'Author: '
    author = gets.chomp

    book = Book.new(title, author)
    @book_list << book
    puts 'Book created successfuly'
    sleep(1)
  end

  def add_rental
    puts 'Choose a person: '
    @people_list.each { |person| puts "#{person.id} : #{person.name}" }
    person_id = gets.chomp.to_i

    person = @people_list.select { |item| item.id == person_id }

    puts 'Choose a book: '
    @book_list.each { |book| puts "#{book.id} : #{book.title}" }
    book_id = gets.chomp.to_i

    book = @book_list.select { |item| item.id == book_id }

    date = Time.now

    rental = Rental.new(date, person[0], book[0])

    @rental_list << rental

    puts 'Rental created'
    sleep(1)
  end
end
