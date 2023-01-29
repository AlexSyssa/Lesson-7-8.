class Wagon
	include Company
	include InstanceCounter

	attr_reader :number
	WAGON_FORMAT = /^[0-9]{1,3}$/
		def initialize(number)
		@number = number.to_s
		validate!
	end
	def valid?
		validate!
		true
	rescue RuntimeError
		false
	end
		def validate!
		raise "Введите номер вагона" if number.nil?
		raise "Номер не соответствует формату. Допустимый формат: от 1 до 999" if number !~ WAGON_FORMAT
		true
	end	
end
