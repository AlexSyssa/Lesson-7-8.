class Route
	include InstanceCounter
	attr_reader :stations, :first_station, :last_station
	def initialize(first_station, last_station)
		@stations = [first_station, last_station]
		register_instance
		validate!
	end
	def valid?
		validate!
		true
	rescue RuntimeError
		false
	end
	def add_station(station)
		add_station!(station)
	end
	def delete_station(station)
		delete_station!(station)
	end
	def all_stations
		all_stations!
	end
	private
	def validate!
		raise "Указанный обьект должен быть станцией" if @stations.find {|station| station.class != Station}
		true 
	end	
	def add_station!(station)
		@stations.insert(-2,station)
	end
	def delete_station!(station)
		if (station == first_station) || (station == last_station)
			puts "Удаление начальной и конечной станции запрещено"
		else
			@stations.delete(station)
		end
	end
	def all_stations!
		@stations.each {|station| puts station.name}
	end
end