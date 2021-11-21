class Board

  attr_reader :size
  def initialize(n)
    @grid = Array.new(n) {Array.new(n, :N)}
    @size = n * n
  end

  def [](arr)
    @grid[arr[0]][arr[1]]
  end

  def []=(pos, val)
    @grid[pos[0]][pos[1]] = val
  end

  def num_ships
    @grid.flatten.count(:S)
  end

  def attack(pos)
    if self[pos] == :S
        self[pos] = :H
        puts "You sunk my battleship!"
        return true
    else
        self[pos] = :X
        return false
    end
  end

  def place_random_ships
    n = @size/2.0

    while num_ships < n/2.0 do # mejor que sea un while loop que se detenga cuando un cuarto del contenido de la grilla sean barcos
        pos = [rand(n), rand(n)]
        puts pos
        if self[pos] != :S
            self[pos] = :S
        end
    end
  end
        
 
end
