require_relative './loads'
require_relative './init'
require_relative './ingame'

class Hangman
  include Load
  include Initialization
  include Ingame

  def initialize(turns = 10)
    @wrong_attempts = []
    @turns = turns
    @secret_word = []
    @secret_hash = Hash.new(0)
    @player_tries = []
    start
  end

  def start
    val = false
    puts "\n1 - Play a new Game?"
    puts "\n2 - Load a Game?"
    puts "\n3 - Exit?"
    while val == false
      answer = gets.chomp
      answer =~ /^[1-3]$/ ? (val = true) : (puts "\nPlease, enter a valid choice!")
    end

    case answer
    when "1"
      init
      main_loop
    when "2"
      load_game
      main_loop
    when "3"
      exit(0)
    end
  end
end

game = Hangman.new
