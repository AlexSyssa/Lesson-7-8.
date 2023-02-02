class Wagon
	include Company
	include InstanceCounter

	WAGON_FORMAT = /^[0-9]{1,3}$/

	attr_reader :number

	def initialize(number, company)
		@number = number.to_s
		@company = company
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
