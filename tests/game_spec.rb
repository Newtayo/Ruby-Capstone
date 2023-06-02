require 'rspec'
require_relative '../item'
require_relative '../Game/game'

RSpec.describe Game do
  describe '#can_be_archived?' do
    context 'when the game was last played more than 2 years ago' do
      it 'returns true' do
        game = described_class.new('Yes', '2019-01-01')
        output = game.send(:can_be_archived?)
        expect(output).to be false
      end
    end

    context 'when the game was last played less than 2 years ago' do
      it 'returns false' do
        game = described_class.new('No', '2022-03-01')
        output = game.send(:can_be_archived?)
        expect(output).to be false
      end
    end
  end
end
