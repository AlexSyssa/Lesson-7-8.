class Train

	include InstanceCounter
	include Company
	
	@@trains = []
	ID_FORMAT = /^[0-9а-яa-z]{3}-?[0-9а-яa-z]{2}$/i

	attr_accessor  :speed, :station, :current_station_index
	attr_reader :id, :route, :wagons,:type

	def initialize(id, type, company)
		@id = id.to_s
		@type = type
		@wagons = []
		@speed = 0
		@current_station_index = 0
		@company = company
		validate!
		register_instance
		@@trains << self
	end

	def wagons_on_train(&block)
		wagons.each {|wagon| block.call(wagon)}
		puts 'К поезду не прицеплены вагоны' if wagons.empty?
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
	end

	def stop
		@speed = 0
	end

	def amount_of_wagons
		wagons.size
	end

	def delete_wagon(wagon)
		wagons.delete(wagon)if @speed.zero? && wagon.type ==type
		raise 'Отцепка вагонов во время движения поезда запрещена' unless @speed.zero?
	end

	def add_wagon(wagon)
		wagons << wagon if wagon.type == type && speed.zero?
		raise 'Прицеплять вагоны во время движения поезда запрещено' unless @speed.zero?
	end

	def take_route(route)
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

	protected

	def validate!
		raise "Номер поезда должен содержать от 5 до 6 символов" if id.length > 6 &&  id.length < 5
		raise "Номер не соответствует формату. Допустимый формат: 3 буквы или цифры, необязательный дефис и еще 2 буквы или цифры" if id !~ ID_FORMAT
		true
	end

end