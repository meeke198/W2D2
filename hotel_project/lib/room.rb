class Room
attr_reader :capacity, :occupants
    def initialize(capacity)
        @capacity = capacity
        @occupants = []
    end

    def full?
        @capacity == @occupants.length
    end
    
    def available_space
       @capacity - @occupants.length
    end

    def add_occupant(person_name)
        if !self.full?
            @occupants << person_name
            return true
        else
            return false
        end
    end

end
