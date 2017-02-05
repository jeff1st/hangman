module Load
  def load_dict(max)
    handler = File.open('./media/words.txt', 'r')
    words = []
    handler.each do |word|
      words << word if (5..max).include?(word.length)
    end
    handler.close
    return words
  end

  def load_game
    puts "loading..."
  end
end
