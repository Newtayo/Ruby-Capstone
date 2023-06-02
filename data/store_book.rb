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
end
