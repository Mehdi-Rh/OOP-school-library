require './app'

class Main
  include App
  def welcome
    puts 'Welcome to School Library App!'
  end

  def show_menu
    puts 'Please choose an option by enterin a number:'
    puts '1 - List all books'
    puts '2 - List all people'
    puts '3 - Add a person'
    puts '4 - Add a book'
    puts '5 - Create a rental'
    puts '6 - List all rentals for a given person id'
    puts '7 - Exit'

    option = gets.chomp
    select_option option
  end

  # rubocop:todo Metrics/MethodLength, Metrics/CyclomaticComplexity
  def select_option(option)
    case option
    when '1'
      display_books
      show_menu
    when '2'
      display_people
      show_menu
    when '3'
      puts "Student type '1', Teacher type '2'"
      person_option = gets.chomp
      add_person(person_option)
      show_menu
    when '4'
      add_book
      show_menu
    when '5'
      add_rental
      show_menu
    when '6'
      display_rentals
      show_menu
    when '7'
      puts 'Thank you for using the app!'
    else
      puts 'The number should be in between 1 and 7'
      show_menu
    end
  end
end
# rubocop:enable Metrics/MethodLength, Metrics/CyclomaticComplexity

def launch_app
  main = Main.new
  main.welcome
  main.show_menu
end

launch_app
