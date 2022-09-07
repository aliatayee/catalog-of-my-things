require_relative '../modules/file_handle'
require_relative '../modules/date_handle'
require_relative '../models/book'

class BookController
  attr_reader :books

  def initialize
    @books = []
    @file_name = 'book.json'
  end

  def add_book()
    print 'Enter the publish date of the book (yyyy-mm-dd): '
    publish_date = gets.chomp
    begin
      DateHandle.from_string(publish_date)
    rescue ArgumentError
      puts 'Invalid Date! Try again'
      add_book
    end
    print 'Who is the Publisher of this book: '
    publisher = gets.chomp
    print 'How is the state of book cover: '
    cover_state = gets.chomp
    new_book = Book.new(publisher, cover_state, publish_date)
    new_book.can_be_archived?
    @books << new_book
    puts 'Book added Successfully!'
  end

  def list_all_books
    return puts 'No Book listed yet' if @books.count.zero?

    puts 'Book List:'
    @books.each.with_index(1) do |book, i|
      print "\n#{i}) Publish Date: #{book.publish_date}, Cover State: #{book.cover_state}, "
      puts "Publish Date: #{book.publish_date}"
    end
  end

  def save_books
    book_object = @books.map do |book|
      { id: book.id, publisher: book.publisher, cover_state: book.cover_state, publish_date: book.publish_date,
        archived: book.archived }
    end
    HandleFiles.write(@file_name, book_object)
  end

  def load_books
    data = HandleFiles.read(@file_name)
    data.each do |book|
      @books << Book.new(book['publisher'],
                         book['cover_state'],
                         book['publish_date'],
                         id: book['id'],
                         archived: book['archived'])
    end
  end
end
