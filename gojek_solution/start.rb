# color to slot 
#
# nearest slot 
# class slot
# class parkinglot
# class car
#
#
# 1.) min heap?
# PQ for empty slots 
# hash for filled slots by key color 
#

class ParkingLot
	def create_parking_lot(number_of_slots)
	end

	def park
	end

	def leave
	end

	def status
	end

	def registration_numbers_for_cars_with_colour
	end

	def slot_numbers_for_cars_with_colour 
	end
	
	def slot_number_for_registration_number 
	end
end


class Car
	def get_color
	end

	def get_registration_number
	end
end

class Slot

	def has_car?
	end

	def get_parked_car
	end
	
	def set_slot_number(slot_number)
		@slot_number = slot_number
	end

	def get_slot_number()
		return @slot_number
	end
end











