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
end
