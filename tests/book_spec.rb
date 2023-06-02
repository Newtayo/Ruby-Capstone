require_relative '../Book/book'
require 'rspec'

RSpec.describe Book do
  describe '#initialize' do
    it 'creates a new instance of Book with correct attributes' do
      publisher = 'Tayo'
      cover_state = 'Good'

      book = described_class.new(publisher, cover_state)
      expect(book.publisher).to eq(publisher)
      expect(book.cover_state).to eq(cover_state)
    end
  end

  describe '#can_be_archived?' do
    it 'returns true if the cover state is "bad"' do
      book = described_class.new('Tayo', 'bad')
      result = book.send(:can_be_archived?)
      expect(result).to be true
    end

    it 'returns false if the cover state is not "bad"' do
      book = described_class.new('Tayo', 'good')
      result = book.send(:can_be_archived?)
      expect(result).to be false
    end
  end
end
