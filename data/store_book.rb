class SaveBook
  def save_books(books)
    book_arr = File.empty?('book.json') ? [] : JSON.parse(File.read('book.json'))
    bookobj = {
      Publisher: books.publisher,
      cover_state: books.cover_state
    }
    book_arr << bookobj
    File.write('book.json', JSON.pretty_generate(book_arr))
  end

  def save_label(label)
    label_arr = File.empty?('label.json') ? [] : JSON.parse(File.read('label.json'))
    labelobj = {
      title: label.title,
      color: label.color
    }
    label_arr << labelobj
    File.write('label.json', JSON.pretty_generate(label_arr))
  end

  def save_game(game)
    game_arr = File.empty?('game.json') ? [] : JSON.parse(File.read('game.json'))
    gameobj = {
      multiplayer: game.multiplayer,
      last_played_at: game.last_played_at
    }
    game_arr << gameobj
    File.write('game.json', JSON.pretty_generate(game_arr))
  end

  def save_author(author)
    author_arr = File.empty?('author.json') ? [] : JSON.parse(File.read('author.json'))
    authorobj = {
      first_name: author.first_name,
      last_name: author.last_name
    }
    author_arr << authorobj
    File.write('author.json', JSON.pretty_generate(author_arr))
  end
end
