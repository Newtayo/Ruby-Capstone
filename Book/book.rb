require_relative '../item'

class Book < Item
  attr_accessor :publisher, :cover_state, :label

  def initialize(publisher, cover_state)
    super(publish_date)
    @publisher = publisher
    @cover_state = cover_state
  end

  private

  def can_be_archived?
    @cover_state.downcase == 'bad' || super
  end
end
