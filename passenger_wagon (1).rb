class PassengerWagon < Wagon
	attr_reader :type
	
	def initialize(number, company, amount_space)
		super(number, company, amount_space)
		@type == :passenger
	end

	def take_space
		raise ArgumentError, 'Вагон заполнен, свободных мест нет' if @amount_space <= 0
		@occupied_space += 1
		@amount_space - @occupied_space 
	end

end

