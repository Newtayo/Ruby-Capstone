require_relative '../item'

class Book < Item
  def initialize(publisher, cover_state)
    super(published_date)
    @publisher = publisher
    @cover_state = cover_state
  end

  private

  def can_be_archived?
    @cover_state.downcase == 'bad' || super
  end
end
