require_relative '../models/author'

describe Author do
  before :each do
    @author = Author.new('David', 'Karp')
  end

  it 'Should be instance of "Author"' do
    expect(@author).to be_instance_of Author
  end

  it 'first_name should return "David"' do
    expect(@author.first_name).to eq 'David'
  end

  it 'last_name should return "Karp"' do
    expect(@author.last_name).to eq 'Karp'
  end

  it 'items count should be 0' do
    expect(@author.items.count).to eq 0
  end

  describe '#add_item' do
    it 'items count should become 1' do
      book = double('book')
      allow(book).to receive(:add_author).with(@author).and_return(true)
      @author.add_item(book)

      expect(@author.items.count).to eq 1
      expect(@author.items[0]).to eq book
    end
  end
end
