class Hangman
    attr_reader :attempted_chars, :guess_word, :remaining_incorrect_guesses
    DICTIONARY = ["cat", "dog", "rabbit", "snake", "lion", "elephant"]
    
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
        attempted_chars.include?(char) ? true : false
    end 

    def get_matching_indices(char)
        indices = []
        if @secret_word.include?(char)
            @secret_word.each_char.with_index {|letter, i| indices << i if char == letter }
        end
        indices
    end

    def fill_indices(char, indices)
        indices.each {|i| @guess_word[i] = char}
    end

    def try_guess(char)
        if self.already_attempted?(char)
            print "That has already been attempted"
            return false
        else
            if self.get_matching_indices(char).empty?
                @attempted_chars << char
                @remaining_incorrect_guesses -= 1
                return true
            else 
                indices = self.get_matching_indices(char)
                self.fill_indices(char, indices)
            end
        end
    end


 def try_guess(char)
    if self.already_attempted?(char)
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

  def ask_user_for_guess
    print 'Enter a char:' 
    char = gets.chomp
    try_guess(char)
  end 

    def win?
      if @guess_word.join("") == @secret_word
          print 'WIN'
          return true
      else
        return false
      end
    end

    def lose?
      if @remaining_incorrect_guesses == 0
          print 'LOSE'
          return true
      else
        return false
      end
    end

    def game_over?
      if win? || lose?
          print "The secret word is #{@secret_word}"
          return true
      else
          return false
      end
    end
end