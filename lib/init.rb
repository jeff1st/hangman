module Initialization
  def init
    val = false
    puts "\nEnter maximum word\'s length (min = 5)"
    while val == false
      answer = gets.chomp
      (answer.to_i >= 5 && answer.to_i <= 25) ? (val = true) : (puts "\nPlease, enter a number between 5 and 25!")
    end
    words = load_dict(answer.to_i)
    create_secret(words)
    create_attempts
    init_var
  end

  def create_secret(words)
    @secret_word = words[rand(words.length)].downcase.split('')
    2.times { @secret_word.pop }
    @secret_word.each { |letter| @secret_hash[letter] += 1 }
  end

  def create_attempts
    @player_tries = (0...@secret_word.length).collect { "_" }
  end

  def init_var
    @turns = 10
    @wrong_attempts = []
  end
end

