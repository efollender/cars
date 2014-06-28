class Car

	@@total_car_count = 0
	@@cars_per_color = {}

	def to_s()
		"I'm a car! I've driven #{@distance} and have #{@fuel} gallons gas left"
	end

	def initialize(color="blue")
		@fuel = 10
		@distance = 0
		@color = color
		if @convertible == "true"
			@roof_status = "The top is closed."
		end
		@@total_car_count +=1
		if @@cars_per_color[@color]
			@@cars_per_color[@color] += 1
		else
			@@cars_per_color[@color] = 1
		end
	end
	def self.cars_per_color
		@@cars_per_color
	end
	def self.total_car_count
		@@total_car_count
	end
	def self.most_popular_color
		pop_color = @@cars_per_color.max_by{|k,v| v}
		return pop_color[0]
	end
	def change_color(new_color)
		@@cars_per_color[@color] -= 1
		if @@cars_per_color[@color] == 0
			@@cars_per_color.delete(@color)
		end
		@color = new_color
		if @@cars_per_color[@color]
			@@cars_per_color[@color] += 1
		else
			@@cars_per_color[@color] = 1
		end
	end
	def drive(miles)
		if (@fuel - miles/20.0) >= 0
			@distance += miles
			@fuel -= miles/20.0
		else
			@distance += @fuel * 20.0
			@fuel = 0
			puts "You're out of gas!"
		end
	end

	def fuel_up()
		gallons_needed = 10.0 - @fuel
		puts "You must pay $#{3.5 * gallons_needed}"
		@fuel = 10.0
	end
end

class ConvertibleCar < Car
	def top_down
		@roof_status = "The top is down."
	end
	def close_top
		@roof_status = "The top is closed."
	end
end