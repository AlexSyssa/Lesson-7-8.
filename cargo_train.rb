class CargoTrain < Train
	def initialize(id, type)
		super(id,type)
		@type == 'Cargo'
	end
end
