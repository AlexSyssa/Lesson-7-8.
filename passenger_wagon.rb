class PassengerWagon < Wagon
	attr_reader :type
	def initialize(number)
		super(number)
		@type == 'Passenger'
	end
end
