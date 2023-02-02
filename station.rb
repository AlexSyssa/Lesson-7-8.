class Station

	include InstanceCounter

	attr_accessor :name, :trains, :train

	@@stations = []
	NAME_FORMAT = /^[0-9а-яa-z]{3,33}$/i
	
	def initialize(name)
		@name = name
		@trains = []
		@train = train
		validate!
		@@stations << self
		register_instance
	end

	def valid?
		validate!
		true
	rescue RuntimeError
		false
	end

	def add_train(train)
		add_train!(train)
	end

	def output_trains
		output_trains!
	end

	def trains_by_type(type)
		trains_by_type!(type)
	end

	def train_dispatch(train)
		train_dispatch!(train)
	end

	private

	def validate!
		raise "Наименование станции должно содержать больше 3 символов" if name.length < 3
		raise "Не соответствует формату. Наименование может содержать от 3 до 33 букв и/или цифр" if name !~ NAME_FORMAT
		true 
	end

	def add_train!(train)
		@trains.push(train)
	end

	def output_trains!
		@trains.each {|train| puts train.id}
	end

	def trains_by_type!(type)
		@trains.each {|train| puts "На станции находятся #{train.id} поезд(а)" if type == type} 
	end

	def train_dispatch!(train)
		@trains.delete(train) if trains.include?(train)
	end
	
	def self.all
		@@stations.each{|station| puts station.name}
	end
end