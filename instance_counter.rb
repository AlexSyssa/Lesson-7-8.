module InstanceCounter
	def self.included(base)
		base.extend ClassMethods
		base.send :include, InstanceMethods
	end
	module ClassMethods
		attr_accessor :instances
		def instance
			@instances ||=0
		end
	end
  protected
  module InstanceMethods
		def register_instance
			self.class.instance
			self.class.instances += 1
		end
	end
end
