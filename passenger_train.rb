class PassengerTrain < Train
	def initialize(id, type)
		super(id,type)
		@type == 'Passanger'
	end
end
