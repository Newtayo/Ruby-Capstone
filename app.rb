require_relative 'Book/book'
require_relative 'Book/label'
require_relative 'Game/author'
require_relative 'Game/game'
require_relative 'music/musicalbum'
require_relative 'music/genre'
require_relative 'data/store_book'
require_relative 'data/list_store'
require 'json'

class App
  def initialize
    @books = []
    @labels = []
  end

  def add_book
    puts 'Add Label title:'
    title = gets.chomp
    puts 'Add Label color:'
    color = gets.chomp
    puts 'Add publisher name:'
    publisher = gets.chomp
    puts 'Add cover state:'
    cover_state = gets.chomp
    book = Book.new(publisher, cover_state)
    @books.push(book)
    label = Label.new(title, color)
    label.add_item(book)
    @labels.push(label)
    puts 'addition done successfully!'
    SaveBook.new.save_books(book)
    SaveBook.new.save_label(label)
  end

  def list_all_labels
    @labels = ReadData.new.read_label
    label_store = @labels.map { |label_item| "Title: #{label_item.title} || Color: #{label_item.color}" }
    puts label_store
  end

  def list_all_books
    @books = ReadData.new.read_books
    book_store = @books.map do |book_item|
      "Publisher: #{book_item.publisher} || Cover state: #{book_item.cover_state}"
    end
    puts book_store
  end
end
