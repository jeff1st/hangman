require_relative '../lib/loads.rb'
require_relative '../lib/hang.rb'

describe '#load_dict' do
  before :all do
    @game = Hangman.new("jeff")
  end

  it "must return a list of words" do
    expect(@game.load_dict).to be_a(Array)
  end

  it "must have a word for first element" do
    expect(@game.load_dict[0]).to be_a(String)
  end
end

