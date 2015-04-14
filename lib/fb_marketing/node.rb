module FbMarketing
	class Node < FbGraph2::Node

		cattr_accessor :attributes

		def update(options = {})#, params)
			# params = self.compact.attributes.to_query
			Rails.logger.warn "-----SELF:  "
			Rails.logger.warn self
			Rails.logger.warn self.inspect
			params = "?access_token=" + self.access_token
			self.attributes.each do |key, value|
				Rails.logger.info key
				Rails.logger.info value
				params += "&#{key}=#{value}" unless (key == "access_token" || key == "raw")
			end
			Rails.logger.warn "-----PARAMS:  "
			Rails.logger.warn params

			handle_response do
				Rails.logger.warn "-----options, build_endpoint, params:"
				Rails.logger.warn build_endpoint(options)
				# Rails.logger.warn params
				http_client.post build_endpoint(options), params
			end
		end

	end
end