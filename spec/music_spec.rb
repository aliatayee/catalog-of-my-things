require_relative '../models/music_album'

describe MusicAlbum do
  before :each do
    @music = MusicAlbum.new('Amos', '2002-04-23', on_spotify: true)
  end

  it 'Should be instance of "MusicAlbum"' do
    expect(@music).to be_instance_of MusicAlbum
  end

  it 'first_name should return "Amos"' do
    expect(@music.name).to eq 'Amos'
  end

  it 'show inheritance from item class' do
    expect(@music).to be_kind_of Item
  end

  it 'last_name should return "publish_date"' do
    expect(@music.publish_date).to eq '2002-04-23'
  end
end
