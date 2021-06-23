class Hangman
  DICTIONARY = ["cat", "dog", "bootcamp", "pizza"]
  attr_reader :guess_word, :attempted_chars, :remaining_incorrect_guesses
  def self.random_word
    DICTIONARY.sample
  end

  def initialize
    @secret_word = Hangman.random_word
    @guess_word = Array.new(@secret_word.length, "_")
    @attempted_chars = []
    @remaining_incorrect_guesses = 5
  end

  def already_attempted?(char)
    @attempted_chars.include?(char)
  end

  def get_matching_indices(char)
    indices = []
    @secret_word.each_char.with_index do |sec_char, i|
      if sec_char == char
        indices << i
      end
    end 
    indices
  end

  def fill_indices(char, indices)
    indices.each {|i| @guess_word[i] = char}
  end


  def try_guess(char)
    if self.already_attempted?(char) == true
      puts 'that has already been attempted'  
      return false
    end
      
    @attempted_chars << char
    char_indices = self.get_matching_indices(char)
    if char_indices.empty?
      @remaining_incorrect_guesses -= 1
    else
      self.fill_indices(char, char_indices)
    end
    return true
  end

  def ask_user_for_guess
    print "Enter a char: "
    char = gets.chomp
    self.try_guess(char)
  end

  def win?
    if @secret_word == @guess_word.join("")
      print "WIN! AMAZING!!!! "
      return true
    else 
      return false
    end
  end

  def lose?
  if @remaining_incorrect_guesses == 0
    print "OOPS! YOU LOSE :(! TRY IT AGAIN :) "
    return true
  else
    return false
  end
  end

  def game_over?
    if win? || lose?
      print "The secret word is " + @secret_word
      return true
    else
      false
    end
  end

end
