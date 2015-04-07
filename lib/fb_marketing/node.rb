module FbMarketing
	class Node < FbGraph2::Node

		# override update because it isnt parsing the parameters correctly
		def update(options = {})
			Rails.logger.info "---UPDATE:  #{self.inspect}"
			post self, options
		end

	end
end