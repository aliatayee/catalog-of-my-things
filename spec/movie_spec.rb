require_relative '../models/movie'

describe Movie do
  before :each do
    @movie = Movie.new 'Test', true, '06-09-2022'
  end

  it 'Check Movie Class instance' do
    expect(@movie).to be_instance_of Movie
  end

  it 'Movie name should be "Test"' do
    expect(@movie.name).to eq 'Test'
  end

  it 'Movie should be "Silent", i.e value must be true' do
    expect(@movie.silent).to eq true
  end
end
