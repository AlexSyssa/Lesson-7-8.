class CargoWagon < Wagon
	attr_reader :type
	
	def initialize(number, company)
		super(number, company)
		@type == 'Cargo'
	end
end