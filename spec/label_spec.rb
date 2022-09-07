require_relative '../models/label'

describe 'Label' do
  before :each do
    @labels = Label.new('Gift', 'red')
  end

  describe 'instance of Label' do
    it 'should be a Label' do
      expect(@labels).to be_instance_of(Label)
    end

    it 'should initialize with id' do
      expect(@labels.id.nil?).to be_truthy
    end
  end

  describe 'Test for Label' do
    it 'should be the title' do
      expect(@labels.title).to eq 'Gift'
    end

    it 'should be the color' do
      expect(@labels.color).to eq 'red'
    end
  end
end
