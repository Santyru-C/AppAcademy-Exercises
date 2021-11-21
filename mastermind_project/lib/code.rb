class Code
  POSSIBLE_PEGS = {
    "R" => :red,
    "G" => :green,
    "B" => :blue,
    "Y" => :yellow
  }
  attr_reader :pegs

  def self.valid_pegs?(chars)
    chars.all? {|char| POSSIBLE_PEGS.has_key?(char.upcase)}
  end

  def initialize(pegs)

    raise "Not a valid PEG" if !Code.valid_pegs?(pegs)
    @pegs = pegs.map(&:upcase)

  end

  def self.random(length)
    random_pegs = []

    length.times {random_pegs << POSSIBLE_PEGS.keys.sample}
    Code.new(random_pegs)
  end

  def self.from_string(pegs)
    Code.new(pegs.split(""))
  end

  def [](index)
    @pegs[index]
  end

  def length
    @pegs.size
  end
  
  def num_exact_matches(guess)
    count = 0
    
    @pegs.each_with_index do |peg, ind|
      count += 1 if peg == guess[ind]
    end
    count
  end

  def num_near_matches(guess)
    count = 0
    temp_guess = []
    temp_pegs = []

    (0...guess.length).each do |i|
      if guess[i] != @pegs[i]
        temp_guess << guess[i]
        temp_pegs << @pegs[i]
      end
    end
    
    (0...guess.length).each do |i|
      if temp_pegs.include?(temp_guess[i])
        count += 1
        temp_pegs.delete(temp_guess[i])
      end
    end
    count
  end

  def ==(guess)
    return true if guess.pegs == @pegs
    return false 
  end

end
