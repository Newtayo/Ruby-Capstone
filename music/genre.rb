require_relative '../item'
class Genre
  attr_accessor :name
  attr_reader :items

  def initialize(name)
    @id = Random.new.rand(1..10)
    @name = name
    @items = []
  end

  def add_item(item)
    items << item
    item.genre = self
  end
end
