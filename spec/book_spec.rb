require_relative '../models/book'

describe 'Book' do
  before :each do
    @books = Book.new('Ali', 'bad', '2022-05-24')
  end

  describe 'instance of book' do
    it 'should be a Book' do
      expect(@books).to be_instance_of(Book)
    end

    it 'should initialize with id' do
      expect(@books.id.nil?).to be_falsey
    end
  end

  describe 'Test est for Book' do
    it 'should be on cover state' do
      expect(@books.cover_state).to eq 'bad'
    end

    it 'Can be archived' do
      expect(@books.can_be_archived?).to eq(true)
    end
  end
end