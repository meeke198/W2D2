require_relative "room"

class Hotel
attr_reader :capacity, :occupants, :rooms
    def initialize(name, hash)
        @name = name
        @rooms = {}
        hash.each do |room_name, capacity|
            @rooms[room_name] = Room.new(capacity)#what is this?
        end
    end

    def name
        (@name.split.map{|ele| ele.capitalize}).join(" ")
    end

    def room_exists?(room_name)
        @rooms.has_key?(room_name)
    end

    def check_in(person, room_name)
        if !room_name.room_exists?
            print 'sorry, room does not exist'
        end

        cur_room = @rooms[room_name].add_occupant(person)
        if cur_room == room_name
            print 'check in successful'
        else
            print 'sorry, room is full'
        end

    end


end
