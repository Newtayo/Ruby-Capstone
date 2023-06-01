require_relative '../item'

class Book < Item
  attr_accessor :publish_date, :publisher, :cover_state

  def initialize(publish_date, publisher, cover_state)
    super(publish_date)
    @publisher = publisher
    @cover_state = cover_state
    @publish_date = publish_date
  end

  private

  def can_be_archived?
    @cover_state.downcase == 'bad' || super
  end
end
