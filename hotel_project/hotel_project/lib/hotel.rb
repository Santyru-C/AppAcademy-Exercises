require_relative "room"

class Hotel
  def initialize(name, r_hash)
    @name = name
    @rooms = {}

    r_hash.each_pair {|k, v| @rooms[k] = Room.new(v)}
  end

  def name
    cap_name = @name.split(" ").map(&:capitalize).join(" ")
  end

  def rooms
    @rooms
  end

  def room_exists?(r_name)
    @rooms.has_key?(r_name)
  end

  def check_in(p_name, r_name)
    if !room_exists?(r_name)
        p "sorry, room does not exist"
    else
        if @rooms[r_name].add_occupant(p_name)
            p "check in successful"
        else
            p "sorry, room is full"
        end
    end
  end

  def has_vacancy?
    if @rooms.values.all? {|room| room.full?}
      return false
    else
      return true
    end
  end

  def list_rooms
    @rooms.each_pair do |k, v|
      puts k + v.available_space.to_s
    end
  end

end
