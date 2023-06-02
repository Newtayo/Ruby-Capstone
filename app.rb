require_relative './Book/book'
require_relative './Book/label'
require_relative './Game/author'
require_relative './Game/game'
require_relative './music/musicalbum'
require_relative './music/genre'
require_relative './preserve_data'

class App < PreserveData
  def initialize
    super()
    @music_albums = []
    @genres = []
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
end
