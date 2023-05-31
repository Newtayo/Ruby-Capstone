require 'date'

class Item
  attr_accessor :id, :published_date, :archived, :genre, :author, :source
  attr_reader :label

  def initialize(*)
    @id = Random.rand(1..1000)
    @published_date = nil
    @archived = false
    @label = nil
    @genre = nil
    @author = nil
    @source = nil
  end

  def move_to_archive
    @archived = true if can_be_archived?
  end

  def label=(label)
    @label = label
    @label.add_item(self) unless @label.items.include?(self)
  end

  private

  def can_be_archived?
    begin
      publish_date = Date.parse(@publish_date)
    rescue StandardError
      publish_date = nil
    end
    if publish_date.nil?
      false
    else
      (Date.today.year - publish_date.year) > 10
    end
  end
end
