require 'json'

class PreserveData
  def save_data
    save_music_genre
  end

  def load_data
    load_music
    load_genre
  end

  def save_music_genre
    music_data = @music_albums.map { |album| { on_spotify: album.on_spotify, publish_date: album.publish_date } }
    genre_data = @genres.map { |genre| { name: genre.name } }

    File.write('store_music.json', JSON.generate(music_data))
    File.write('store_genres.json', JSON.generate(genre_data))
  end

  def load_music
    filename = 'store_music.json'
    return unless File.exist?(filename) && !File.empty?(filename)

    music_data = JSON.parse(File.read(filename), symbolize_names: true)
    @music_albums = music_data.map { |item| MusicAlbum.new(item[:on_spotify], item[:publish_date]) }
  end

  def load_genre
    filename = 'store_genres.json'
    return unless File.exist?(filename) && !File.empty?(filename)

    genre_data = JSON.parse(File.read(filename), symbolize_names: true)
    @genres = genre_data.map { |item| Genre.new(item[:name]) }
  end
end
