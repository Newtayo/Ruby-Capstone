# rubocop:disable Metrics/CyclomaticComplexity
class Select
  def initialize
    @app = nil
  end

  def opt_select(opt)
    case opt
    when 1
      @app.add_book
    when 2
      @app.add_music_album
    when 3
      @app.add_game
    when 4
      @app.list_all_books
    when 5
      @app.list_all_music_albums
    when 6
      @app.list_all_games
    when 7
      puts 'Thanks for using this app'
      exit
    else
      puts 'Option entered is invalid'
    end
  end
end
# rubocop:disable Metrics/CyclomaticComplexity