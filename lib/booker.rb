require_relative "room"
require_relative "date_range"
require "date"

module Hotel
    class Booker
        attr_reader :rooms, :reservations

        def initialize
            @rooms = load_rooms
            @reservations = []
        end

        def load_rooms
            rooms = []
            20.times do |i|
                rooms.push(Hotel::Room.new(i+1))
            end
            return rooms
        end

        def book_room(start_date: ,end_date: )
            range = get_dates(start_date: start_date,end_date: end_date)
            new_reservation = create_reservation(id: reservations.length + 1,date_range: range, room: nil)
            booked_room = find_room
            new_reservation.room = booked_room
            add_to_room(room: booked_room, reservation: new_reservation)
            add_to_reservation_list(new_reservation)
            return new_reservation
        end

        def get_dates(start_date:, end_date:)
            range = Hotel::Date_Range.new(start_date: start_date,end_date: end_date).range
            return range
        end

        def create_reservation(id: ,date_range: , room: )
            reservation = Hotel::Reservation.new(id: id,date_range: date_range ,room: room)
            return reservation
        end

        def find_room
            return rooms[0]
        end

        def add_to_room(room: , reservation: )
            room.reservations.push(reservation)
        end

        def add_to_reservation_list(reservation)
            reservations.push(reservation)
        end

        def view_reservations(date)
            desired_date = Date.iso8601(date.to_s)
            list_by_date = reservations.select{|reservation| reservation.date_range.include?(desired_date) == true}
            return list_by_date
        end

    end
end