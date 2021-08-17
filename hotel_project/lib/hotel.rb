require_relative "room"
class Hotel
    attr_reader :rooms 
    def initialize(name, all_room_hash)
        @name = name
        @rooms = Hash.new{0}
        all_room_hash.each do |room_name, capacity|
            @rooms[room_name] = Room.new(capacity)
        end
        #CHU Y: line 8-11: Room.new(capacity) là một instance của Room, nên nó là nguyên một room hoàn chỉnh
        # suy ra cái hash rooms có key => value là tên_room => 1 cái room hoàn chỉnh (bao gồm room_capacity & room occupant)
    end

    def name
        (@name.split(" ").map {|word| word = word.capitalize}).join(" ")
    end

    def room_exists?(room_name)
        @rooms.has_key?(room_name)
    end

    def check_in(person, room_name)
        if room_exists?(room_name)
            if @rooms[room_name].add_occupant(person)
                print 'check in successful'
            else
                print 'sorry, room is full'
            end
        else
            print 'sorry, room does not exist'
        end
    end
    def has_vacancy?
        @rooms.each do |room_name, room| 
           return true if !room.full?
        end
        return false
    end
    def list_rooms
         @rooms.each do |room_name, room| 
            print "#{room_name}.*#{room.available_space}\n"
         end
    end
    
end

# CHÚ Ý: line 28: @rooms[room_name].add_occupant(person)
# vì sao lại phải có receiver cho method .add_occupant?
# vì mình đang trongg class hotel, nếu không có receiver(là room instance) thì ruby sẽ call method đó lên hotel instance vì mình đang trong hotel Class
# @rooms[room_name] là room instance, track lại line 10 khi tạo room => hehee, quá make sense nha
# Line 39: \n = chomp!