require_relative '../Item'
require_relative '../music/musicalbum'

RSpec.describe MusicAlbum do
  let(:album) { MusicAlbum.new(true, '2023-05-30') }

  describe '#initialize' do
    it 'sets the on_spotify attribute' do
      expect(album.on_spotify).to be true
    end
  end

  describe '#can_be_archived?' do
    context 'when the item can be archived and is on Spotify' do
      it 'returns true' do
        expect(album.can_be_archived?).to be false
      end
    end

    context 'when the item cannot be archived' do
      let(:album) { MusicAlbum.new(false, '2023-05-30') }

      it 'returns false' do
        expect(album.can_be_archived?).to be false
      end
    end

    context 'when the item is not on Spotify' do
      let(:album) { MusicAlbum.new(true, '2023-05-30') }

      before do
        allow(album).to receive(:super).and_return(false)
      end

      it 'returns false' do
        expect(album.can_be_archived?).to be false
      end
    end
  end
end
