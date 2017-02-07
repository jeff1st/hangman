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
    if @file != nil
      answer = @file
    else
      puts "\nWhat is the save name?"
      puts "\n"
      answer = gets.chomp.downcase
      @file = answer
    end
    handler = File.open("./media/#{answer}.json", 'w+')
    data = JSON.dump({"attempts": @wrong_attempts, "turns": @turns, "secret_word": @secret_word, "secret_hash": @secret_hash, "player_tries": @player_tries, "file": @file})
    handler.puts data
    handler.close
    puts "\nSee you soon then!"
    exit(0)
  end
  
  def show_games
    val = false
    res = []
    Dir.foreach('./media/') do |file|
      res << file.slice(0..-6) if file =~ /.json$/
    end
    puts "\nWhich game do you want to load?"
    while val == false
      res.each { |name| puts "\n#{name}" }
      puts "\n"
      answer = gets.chomp
      res.include?(answer) ? (val = true) : (puts "\nPlease, give a real name")
    end
    load_game(answer)
  end

  def load_game(name)
    handler = File.open("./media/#{name}.json", 'r')
    data = JSON.load handler.read
    @wrong_attempts = data['attempts']
    @turns = data['turns']
    @secret_word = data['secret_word']
    @secret_hash = data['secret_hash']
    @player_tries = data['player_tries']
    @file = data['file']
    handler.close
  end
end
