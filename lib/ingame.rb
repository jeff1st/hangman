module Ingame
  def main_loop
    val = false
    while @turns > 0
      puts "\nUntil there:"
      puts "\nYour guesses: #{@player_tries}"
      puts "\nBad  attempts: #{@wrong_attempts}"
      puts "\nGuess a letter? Attempts left #{@turns}!!"
      while val == false
        answer = gets.chomp.downcase
        answer =~ /^[a-z]$/ ? (val = true) : (puts "\nPlease, enter a valid letter!")
      end

      check_letter(answer)
      check_win
      val = false
    end
    puts "\nYou loose"
    puts "\nWord to guess was #{@secret_word.join('')}"
    puts "\n"
    start
  end

  def check_letter(letter)
    if @secret_hash.include?(letter) && @secret_hash[letter] != 0
      puts "\nGood guess!!"
      puts "\n"
      puts "\n"
      @secret_hash[letter] -= 1
      implement_tries(letter)
    else
      puts "\nBad guess!!"
      puts "\n"
      puts "\n"
      @wrong_attempts << letter
      @turns -= 1
    end
  end

  def check_win
    if @player_tries == @secret_word
      puts "\nYou win!!"
      puts "\nWord to discover was #{@secret_word.join('')}"
      puts "\n"
      start
    end
  end

  def implement_tries(letter)
    (0...@secret_word.length).each do |i|
      @player_tries[i] = letter if (@secret_word[i] == letter && @player_tries[i] == "_")
    end
  end
end
