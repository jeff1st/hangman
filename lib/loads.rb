module Load
  require 'json'

  def load_dict(max)
    handler = File.open('./media/words.txt', 'r')
    words = []
    handler.each do |word|
      words << word if (5..max).include?(word.length)
    end
    handler.close
    return words
  end
  
  def save_game
    handler = File.open('./media/save.json', 'w+')
    data = JSON.dump({"attempts": @wrong_attempts, "turns": @turns, "secret_word": @secret_word, "secret_hash": @secret_hash, "player_tries": @player_tries})
    handler.puts data
    handler.close
    puts "\nSee you soon then!"
    exit(0)
  end

  def load_game
    handler = File.open('./media/save.json', 'r')
    data = JSON.load handler.read
    @wrong_attempts = data['attempts']
    @turns = data['turns']
    @secret_word = data['secret_word']
    @secret_hash = data['secret_hash']
    @player_tries = data['player_tries']
    handler.close
  end
end
