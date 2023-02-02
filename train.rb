class Train

	include InstanceCounter
	include Company
	
	@@trains = []
	ID_FORMAT = /^[0-9а-яa-z]{3}-?[0-9а-яa-z]{2}$/i

	attr_accessor :wagons, :speed, :station, :current_station_index, :type, :wagon
	attr_reader :id, :route

	def initialize(id, type, company)
		@id = id.to_s
		@wagons = []
		@wagon = wagon
		@speed = 0
		@current_station_index = 0
		@type = type
		@company = company
		validate!
		register_instance
		@@trains << self
	end

	def valid?
		validate!
		true
	rescue RuntimeError
		false
	end

	def self.find(id)
		@@trains.find {|train| train.id == id}
	end

	def speed_up(value)
		@speed += value
		@speed
	end

	def stop
		@speed = 0
	end

	def amount_of_wagons
		wagons.size
	end

	def delete_wagon(wagon)
		delete_wagon!(wagon)
	end

	def add_wagon(wagon)
		add_wagon!(wagon)
	end

	def take_route(route)
		take_route!(route)
	end

	def next_station
		next_station!
	end

	def previous_station
		previous_station!
	end

	protected

	def validate!
		raise "Номер поезда должен содержать от 5 до 6 символов" if id.length > 6 &&  id.length < 5
		raise "Номер не соответствует формату. Допустимый формат: 3 буквы или цифры, необязательный дефис и еще 2 буквы или цифры" if id !~ ID_FORMAT
		true
	end

	def delete_wagon!(wagon)
		if @speed.zero? 
			@wagons.delete(wagon)
		else
			puts "Отцепка вагонов может осуществляться только если поезд не движется"
		end
	end

	def add_wagon!(wagon)
		if @speed.zero?
			@wagons << wagon
		else
			puts "Прицепка вагонов может осуществляться только если поезд не движется"
		end
	end

	def take_route!(route)
		@route = route
		@current_station_index = 0
	end

  def next_station!
		if @current_station_index == 0
			@current_station_index == 1
		elsif @current_station_index == 1
			@current_station_index == -1
		else
			puts "This is a last station"
		end
	end

	def previous_station!
		if @current_station_index == -1
			@current_station_index == 1
		elsif @current_station_index == 1
			@current_station_index == 0
		else
			puts "Вы находитесь на первой станции"
		end
	end
end