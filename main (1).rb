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
		{ id:13, title: 'Просмотреть список поездов на станции с указанием харатеристик', action: :list_trains_on_station},
		{ id:14, title: 'Просмотреть список вагонов у поезда', action: :wagons_list},
		{ id:15, title: 'Занять место/объем в вагоне', action: :take_spaces }

	].freeze

	attr_accessor :wagon, :wagons, :route, :station, :routes, :stations
	
	def initialize
		@trains = []
		@routes = []
		@stations = []
		@route = route
		@station = station
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
			puts 'Выберите необходимое действие и введите соответствующую цифру:'
			choice = gets.chomp.to_i
			break if choice.zero?
			puts 
			send(MENU[choice][:action])
		end
	end

	def new_station
		puts "Введите наименование станции"
	 	name = gets.chomp
	 	@stations << Station.new(name)
	 	puts "Станция #{name} создана."

	rescue RuntimeError => e
	  puts e.message
	  retry 	
	end

	def new_train
		puts "Введите номер поезда согласно формату xxx-xx или xxxxx"
	 	id = gets.chomp.to_s
	 	puts "Введите наименование производителя поезда"
		company = gets.chomp.to_s
	 	puts "Выберите тип поезда: passenger или cargo"
	 	type = gets.chomp.to_sym
	 	if type == :passenger
	 		train = PassengerTrain.new(id, type, company)
	 		puts "Пассажирский поезд № #{id} создан, производитель поезда: #{company}"
	 	else
	 		train = CargoTrain.new(id, type, company)
	 		puts "Грузовой поезд № #{id} создан производитель поезда: #{company}"
	 	end
	 	@trains << train

	rescue RuntimeError => e
	  puts e.message
	  retry 
	end

  def new_route
	 	puts "Укажите первую станцию маршрута"
	 	first_station_name = gets.chomp
	 	first_station = Station.new(first_station_name)
	 	puts "Укажите последнюю станцию маршрута"
	 	last_station_name = gets.chomp
	 	last_station = Station.new(last_station_name)
	 	route = Route.new(first_station, last_station)
	 	@routes << route
	 	@stations << last_station
	 	@stations << first_station
	 	puts "Маршрут создан. Начальная станция маршрута - #{first_station_name}, конечная станция маршрута #{last_station_name}"
	rescue RuntimeError => e
	  puts e.message
	  retry 
	end

	def add_station
		puts "Введите наименование промежуточной станции"
	  name = gets.chomp.to_s
	 	station =  Station.new(name)
	 	@stations.insert(-2, station)
	end

	def delete_station
		puts "Введите наименование станции"
	  station = gets.chomp.to_s
		@stations.delete(station)
	end

	def set_route
		puts "Введите номер поезда"
		id = gets.chomp.to_s
		if trains.include?(train(id))
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
		puts "Введите номер поезда, к которому необходимо прицепить вагон"
		id = gets.chomp.to_s
		puts "Введите номер вагона"
		number = gets.chomp.to_i
		puts 'Введите тип вагона 1 - пассажирский, 2 - грузовой'
		wagon_type = gets.chomp.to_i
		puts "Введите наименование производителя вагона"
		company = gets.chomp.to_s
		case wagon_type
		when 1
			puts "Введите общее количество мест в вагоне"
		  amount_seat = gets.chomp.to_i
			wagon = PassengerWagon.new(number, company, amount_seat)
		when 2
			puts "Введите объем грузового вагона"
		  full_volume = gets.chomp.to_i
			wagon = CargoWagon.new(number, company, full_volume)
		end
		wagons << wagon
		puts "Вагон №#{number}, производителя #{company} успешно присоединен к поезду №#{id}"
	rescue RuntimeError => e
	  puts e.message
	  retry 	
	end

	
  def delete_wagon
		puts "Введите номер поезда"
		id = gets.chomp.to_i
		puts "Введите номер вагона"
		number = gets.chomp.to_i
		train(id).delete_wagon(wagon_of_train(id, number))
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

	def list_trains_on_station
		puts "Введите наименование станции"
		station_name = gets.chomp
		find_station(station_name).trains_on_station do |train|
			puts "#{train.type} поезд №#{train.id}, количество вагонов #{train.amount_of_wagons}"
		end
	end

	def find_station(station)
		@stations.find {|object| object.name == station }
	end

	def wagons_list
		puts "Введите номер поезда"
		id = gets.chomp
		train(id).wagon_of_train do |wagon|
		  if train(id).type == :passenger
			  puts "Пассажирский вагон №#{wagon.number}. Количество свободных мест:#{wagon.free_seat}. Количество занятых мест #{wagon.occupied_seat}"
		  else
			  puts "Грузовой вагон №#{wagon.number}. Количество свободного объема:#{wagon.free_volume}. Количество занятого объема #{wagon.occupied_volume}"
		  end
		end
  end

  def train(id)
  	@trains.find { |train| train.id == id }
  end

  def wagon_of_train(id, number)
  	train(id).wagons.find { |wagon| wagon.number == number}
  end

	def take_spaces
		puts "Введите номер поезда"
		id = gets.chomp
		puts "Введите номер вагона"
		number = gets.chomp
		if train(id).type == :passenger
			wagon1 = wagon_of_train(id, number)
			wagon1.take_space
			puts "Вы заняли место в вагоне #{number}, количество свободных мест:#{wagon.free_space}."
		else 
			puts 'Введите загружаемый объем'
			volume = gets.chomp.to_i
			wagon_of_train(id, number).take_space(volume)
			puts "Вы загрузили объем в размере #{volume}, количество свободного объема:#{wagon.free_space}."
		end
	end
end

Main.new.program