require_relative '../models/source'

describe Source do
  # Arrange
  before :each do
    @source = Source.new('New Source')
  end

  it 'Should be instance of "Source"' do
    expect(@source).to be_instance_of Source
  end

  it 'name should return "New Source"' do
    expect(@source.name).to eq 'New Source'
  end

  it 'items count should be 0' do
    expect(@source.items.count).to eq 0
  end

  describe '#add_item' do
    it 'items count should become 1' do
      # ACT
      movie = double('movie')
      allow(movie).to receive(:add_source).with(@source).and_return(true)
      @source.add_item(movie)

      # ASSERT
      expect(@source.items.count).to eq 1
      expect(@source.items[0]).to eq movie
    end
  end
end
