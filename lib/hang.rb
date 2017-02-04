require 'loads'

class Hangman
  include Load

  def initialize(name, number = 10)
    @name = name
    @number = number
  end

  def start
    puts "hello"
  end
end

