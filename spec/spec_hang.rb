require_relative '../lib/hang'

describe 'Hangman' do
  before :all do
    @hang = Hangman.new("jeff")
  end
  
  it 'should be an instance of Hangman' do
    expect(@hang).to be_instance_of(Hangman)
  end

  describe '#start' do
    xit 'Initialize game' do

    end
  end
end

