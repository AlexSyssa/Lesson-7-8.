class PassengerTrain < Train
	def initialize(id, type, company)
		super(id, type, company)
		@type == 'Passanger'
	end
end
