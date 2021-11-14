class Hangman
  DICTIONARY = ["hola", "amigo", "bienvenido", "spanish"]
  
  def self.random_word
    DICTIONARY.sample
  end

  def initialize
    @secret_word = Hangman.random_word
    @guess_word = Array.new(@secret_word.length) {"_"}
    @attempted_chars = []
    @remaining_incorrect_guesses = 5
  end

  def guess_word
    @guess_word
  end

  def attempted_chars
    @attempted_chars
  end

  def remaining_incorrect_guesses
    @remaining_incorrect_guesses
  end

  def already_attempted?(char)
    if @attempted_chars.include?(char)
      return true
    else
      return false
    end
  end

  def get_matching_indices(char)
    indices = []
    if !@secret_word.include?(char)
      return indices
    else
      @secret_word.each_char.with_index do |c, i|
        indices << i if c == char
      end
      indices
    end
  end

  def fill_indices(char, arr)
    arr.each {|i| @guess_word[i] = char}
    @secret_word
  end

end
