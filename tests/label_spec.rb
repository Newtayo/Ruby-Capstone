require_relative '../Book/label'
require_relative '../item'

RSpec.describe Label do
  describe '#initialize' do
    it 'creates a new instance of Label with correct attributes' do
      title = 'New'
      color = 'Green'
      label = described_class.new(title, color)
      expect(label).to be_instance_of(Label)
      expect(label.title).to eq(title)
      expect(label.color).to eq(color)
    end
  end
  describe '#initialize' do
    it 'creates a new instance of Label with correct attributes' do
      title = 'New'
      color = 'Green'
      label = described_class.new(title, color)
      item = Item.new
      result = label.add_item(item)
      expect(label).to be_instance_of(Label)
      expect(result.title).to eq(title)
    end
  end
end
