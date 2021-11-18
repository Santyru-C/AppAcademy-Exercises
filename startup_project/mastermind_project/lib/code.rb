class Code
  POSSIBLE_PEGS = {
    "R" => :red,
    "G" => :green,
    "B" => :blue,
    "Y" => :yellow
  }
  attr_reader :pegs

  def self.valid_pegs?(chars)
    chars.each do |char|
      return false if !POSSIBLE_PEGS.has_key?(char.upcase)
    end
    return true
  end

  def initialize(pegs)

    raise "Not a valid PEG" if !Code.valid_pegs?(pegs)
    @pegs = pegs.each(&:upcase!)

  end

  def self.random(length)
    random_pegs = []

    length.times {random_pegs << POSSIBLE_PEGS.keys.sample}
    Code.new(random_pegs)
  end
  

end
