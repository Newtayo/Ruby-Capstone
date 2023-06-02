require 'date'

class Item
  attr_accessor :id, :publish_date, :archived, :genre, :author, :source
  attr_reader :label

  def initialize(*)
    @id = Random.rand(1..1000)
    @publish_date = nil
    @archived = false
    @label = nil
    @authors = author
    @genre = nil
    @author = nil
    @source = nil
  end

  def move_to_archive
    @archived = true if can_be_archived?
  end
  end

  private

  def can_be_archived?
    begin

    rescue StandardError
      publish_date = nil
    end
    if publish_date.nil?
      false
    else
      (Date.today.year - publish_date.year) > 10
    end
  end

  def add_genre=(genre)
    @genre = genre
    @genre.add_item(self) unless @genre.items.include?(self)
  end
end
