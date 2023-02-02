class CargoTrain < Train
	
	def initialize(id, type, company)
		super(id, type, company)
		@type == 'Cargo'
	end
	
end