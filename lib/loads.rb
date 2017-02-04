module Load
  def load_dict
    handler = File.open('./media/words.txt', 'r')
    words = []
    handler.each do |word|
      words << word if (5..12).include?(word.length)
    end
    handler.close
    return words
  end
end
