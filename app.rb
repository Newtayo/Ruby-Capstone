require_relative './Book/book'
require_relative './Book/label'
require_relative './Game/author'
require_relative './Game/game'
require_relative './music/musicalbum'
require_relative './music/genre'
require_relative './preserve_data'
require_relative 'data/store_book'
require_relative 'data/list_store'
require 'json'
class App
  def initialize
    @books = []
    @labels = []
    @authors = []
    @games = []
    @music_albums = []
    @genres = []
  end
  def add_game
    puts 'Is it a multiplayer game [Y/N]:'
    choice = gets.chomp.upcase
    multiplayer = nil

    case choice
    when 'Y'
      multiplayer = 'Yes'
    when 'N'
      multiplayer = 'No'
    else
      puts 'Invalid input'
      return
    end
    puts 'Add last_played_at:'
    last_played_at = gets.chomp
    puts 'Add first_name:'
    first_name = gets.chomp
    puts 'Add last_name:'
    last_name = gets.chomp
    game = Game.new(multiplayer, last_played_at)
    @games.push(game)
    author = Author.new(first_name, last_name)
    @authors.push(author)
    puts 'addition done successfully!'
    SaveBook.new.save_game(game)
    SaveBook.new.save_author(author)
  end
def add_music_album
    puts 'Is it on Spotify [Y/N]:'
    choice = gets.chomp.upcase
    on_spotify = nil

    case choice
    when 'Y'
      on_spotify = true
    when 'N'
      on_spotify = false
    else
      puts 'Invalid input'
      return
    end
    puts 'Add Published date:'
    publish_date = gets.chomp
    puts 'Add Genre Name:'
    name = gets.chomp
    music = MusicAlbum.new(on_spotify, publish_date)
    genre = Genre.new(name)
    genre.add_item(music)
    @music_albums << music
    @genres << genre
  end
  def list_all_music_albums
    album = @music_albums.map do |music_items|
      "On spotify:#{music_items.on_spotify} || publish date:#{music_items.publish_date}"
    end
    puts album
  end
 def list_all_genres
    gen = @genres.map { |genre_items| "Genre Name:#{genre_items.name}" }
    puts gen
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

  def list_all_games
    @games = ReadData.new.read_game
    game_store = @games.map do |game_item|
      "Multiplayer: #{game_item.multiplayer} || Last Played at: #{game_item.last_played_at}"
    end
    puts game_store
  end

  def list_all_authors
    @authors = ReadData.new.read_author
    author_store = @authors.map do |author_item|
      "First Name: #{author_item.first_name} || Last name: #{author_item.last_name}"
    end
    puts author_store

  end
end
