class PassengerTrain < Train
	def initialize(id, type, company)
		super(id, type, company)
		@type == :passanger
	end
end
