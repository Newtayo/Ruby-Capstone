class Label
  attr_accessor :id, :title, :color
  attr_reader :items

  def initialize(title, color)
    @id = Random.rand(1..1000)
    @title = title
    @color = color
    @items = []
  end

  def add_item(item)
    items << item
    item.label = self if item.label != self
  end
end
