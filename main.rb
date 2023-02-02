require_relative 'instance_counter'
require_relative 'company'
require_relative 'station'
require_relative 'route'
require_relative 'train'
require_relative 'passenger_train'
require_relative 'cargo_train'
require_relative 'wagon'
require_relative 'passenger_wagon'
require_relative 'cargo_wagon'

class Main

	MENU = [
		{ id:0, title: 'Выйти из приложения', action: :exit },
		{ id:1, title: 'Создать станцию"', action: :new_station },
		{ id:2, title: 'Создать поезд', action: :new_train },
		{ id:3, title: 'Создать маршрут', action: :new_route },
		{ id:4, title: 'Добавить станцию в маршрут', action: :add_station },
		{ id:5, title: 'Удалить станцию из маршрута', action: :delete_station },
		{ id:6, title: 'Назначить маршрут поезду', action: :set_route },
		{ id:7, title: 'Прицепить вагон к поезду', action: :set_wagon },
		{ id:8, title: 'Отцепить вагон от поезда', action: :delete_wagon },
		{ id:9, title: 'Переместить поезд по маршруту вперед', action: :next_station },
		{ id:10, title: 'Переместить поезд по маршруту назад', action: :previous_station },
		{ id:11, title: 'Просмотреть список станций на маршруте', action: :list_stations },
		{ id:12, title: 'Просмотреть список поездов на станции', action: :list_trains },
	].freeze

	attr_accessor :first_station, :last_station, :train, :number_trains, :number_train, :wagon, :wagons, :route, :station, :company
	
	def initialize
		@trains = []
		@routes = []
		@first_station = first_station
		@last_station = last_station
		@id_trains = []
		@route = route
		@station = station
		@company = company
		@wagons = []
		@wagon = wagon
		
	end

	def start_menu
		puts ""
		puts ""
		puts "Меню:"
		MENU.each do |item|
			puts "#{item[:id]} - #{item[:title]}"
		end
	end

	def program
		loop do
			start_menu
			puts "Выберите необходимое действие и введите соответствующую цифру: "
			choice = gets.chomp.to_i
			break if choice.zero?
			puts 
			send(MENU[choice][:action])
		end
	end

	def new_station
		puts "Введите наименование станции"
	 	name = gets.chomp
	 	station = Station.new(name)
	rescue RuntimeError => e
	  puts e.message
	  retry 	
	end
	def new_train
		puts "Введите номер поезда"
	 	id = gets.chomp.to_s
	 	@id_trains << id
	 	puts "Введите наименование производителя поезда"
		@company = gets.chomp.to_s
	 	puts "Выберите тип поезда, 1 - Пассажирский, 2 - Грузовой"
	 	type = gets.chomp.to_i
	 	if type == 1 
	 		train = PassengerTrain.new(id, 'Passenger', company)
	 		puts "Пассажирский поезд № #{id} создан"
	 		@trains << train
	 	else
	 		train = CargoTrain.new(id, 'Cargo', company)
	 		puts "Грузовой поезд № #{id} создан"
	 		@trains << train
	 	end

	rescue RuntimeError => e
	  puts e.message
	  retry 
	end

  def new_route
	 	puts "Укажите первую станцию маршрута"
	 	first_station_name = gets.chomp
	 	first_station = Station.new(first_station_name )
	 	puts "Укажите последнюю станцию маршрута"
	 	last_station_name = gets.chomp
	 	last_station = Station.new(last_station_name)
	 	@route = Route.new(first_station, last_station)
	 	puts "Маршрут создан. Начальная станция маршрута - #{first_station_name}, конечная станция маршрута #{last_station_name}"
	rescue RuntimeError => e
	  puts e.message
	  retry 
	end

	def add_station
		puts "Введите наименование промежуточной станции"
	  name = gets.chomp.to_s
	 	station =  Station.new(name)
	 	route.add_station(station)
	end

	def delete_station
		route.delete_station(station)
	end

	def set_route
		puts "Введите номер поезда"
		id = gets.chomp.to_s
		if @id_trains.include?(id)
			puts "Введитете наименование первой станции"
			first_station2 = gets.chomp.to_s
	 	  first_station = Station.new(first_station2)
	 	  puts "Введитете наименование конечной станции"
	 	  last_station2 = gets.chomp.to_s
	 	  last_station = Station.new(first_station2)
	 	  route = Route.new(first_station, last_station)
	 	  @route = route
	 	  @current_station_index = 0
	 	else
	 		puts"Поезда с данным номером не существует. Перед назначением маршрута необходимо создать поезд."
	 	end
	end

	def set_wagon
		puts "Введите номер вагона"
		number = gets.chomp.to_i
		puts 'Введите тип вагона 1 - пассажирский, 2 - грузовой'
		wagon_type = gets.chomp.to_i
		puts "Введите наименование производителя вагона"
		@company = gets.chomp.to_s
		puts "Введите номер поезда, к которому необходимо прицепить вагон"
		id = gets.chomp.to_s
		case wagon_type
		when 1
			@wagon = PassengerWagon.new(number, company)
		when 2
			@wagon = CargoWagon.new(number, company)
		end
		wagons << wagon
	rescue RuntimeError => e
	  puts e.message
	  retry 	
	end

	def delete_wagon
		puts "Введите номер поезда"
		id = gets.chomp.to_i
		puts "Введите номер вагона"
		number = gets.chomp.to_i
		train.delete_wagon(wagon)
	end

	def next_station
		train.next_station
	end

	def previous_station
		train.previous_station
	end

	def list_stations
		route.all_stations
	end

	def list_trains
		@id_trains.each {|id| puts id}
	end
end
Main.new.program



	 	






