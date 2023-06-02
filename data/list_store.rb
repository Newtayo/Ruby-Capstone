class ReadData
  def read_books
    books_list = []
    return books_list unless File.exist?('book.json')

    file = File.open('book.json')
    data = JSON.parse(file.read)
    data.each do |book|
      books_list << Book.new(book['Publisher'], book['cover_state'])
    end
    file.close
    books_list
  end

  def read_label
    label_list = []
    return label_list unless File.exist?('label.json')

    file = File.open('label.json')
    data = JSON.parse(file.read)
    data.each do |label|
      label_list << Label.new(label['title'], label['color'])
    end
    file.close
    label_list
  end

  def read_game
    game_list = []
    return game_list unless File.exist?('game.json')

    file = File.open('game.json')
    data = JSON.parse(file.read)
    data.each do |game|
      game_list << Game.new(game['multiplayer'], game['last_played_at'])
    end
    file.close
    game_list
  end

  def read_author
    author_list = []
    return author_list unless File.exist?('author.json')

    file = File.open('author.json')
    data = JSON.parse(file.read)
    data.each do |author|
      author_list << Author.new(author['first_name'], author['last_name'])
    end
    file.close
    author_list
  end
end
