require_relative '../music/genre'
require_relative '../item'

describe Genre do
  let(:genre) { Genre.new('Science Fiction') }
  let(:item) { Item.new }

  describe '#initialize' do
    it 'should initialize a genre with a name' do
      expect(genre.name).to eq('Science Fiction')
    end

    it 'should initialize an empty collection of items' do
      expect(genre.items).to be_empty
    end
  end

  describe '#add_item' do
    it 'should add an item to the collection' do
      genre.add_item(item)
      expect(genre.items).to include(item)
    end

    it 'should set the genre of the item to the current genre' do
      genre.add_item(item)
      expect(item.genre).to eq(genre)
    end
  end
end
