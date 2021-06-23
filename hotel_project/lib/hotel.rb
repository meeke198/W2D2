require_relative "room"

class Hotel
attr_reader :capacity, :occupants, :rooms
    def initialize(name, all_hotel_rooms)
        @name = name
        @rooms = {}
        all_hotel_rooms.each do |room_name, capacity|
            @rooms[room_name] = Room.new(capacity)#what is this?
        end
    end

    def name
        (@name.split(" ").map{|ele| ele.capitalize}).join(" ")
    end

    def room_exists?(room_name)
        @rooms.has_key?(room_name)
    end

    def check_in(person, room_name)
        if self.room_exists?(room_name)
            if available = @rooms[room_name].add_occupant(person)
                print 'check in successful'
            else
            print 'sorry, room is full'
            end
        else
            print 'sorry, room does not exist'
        end

        def has_vacancy?
            @rooms.values.any? {|capacity| !capacity.full?} #why cant it be @rooms.full?
        end
            
        
        def list_rooms
            @rooms.each do |room, capacity|
                puts "#{room} : #{capacity.available_space}"
            end
        end
            
    
    end


end
