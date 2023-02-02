class PassengerWagon < Wagon
	attr_reader :type

	def initialize(number, company)
		super(number, company)
		@type == 'Passenger'
	end
end
