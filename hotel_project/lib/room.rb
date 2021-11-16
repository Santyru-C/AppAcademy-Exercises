class Room
    def initialize(cap)
        @capacity = cap
        @occupants = []
    end

    def capacity
        @capacity
    end
    
    def occupants
        @occupants
    end

    def full?
        return false if @occupants.size < @capacity
        true
    end

    def available_space
        @capacity - @occupants.size
    end

    def add_occupant(name)
        if !full?
            @occupants << name
            return true
        else
            return false
        end
    end
end
