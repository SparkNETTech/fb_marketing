module FbMarketing
	class Node < FbGraph2::Node

		def update(options = {})#, params)
			# params = self.compact.attributes.to_query
			Rails.logger.warn "-----SELF:  "
			Rails.logger.warn self
			Rails.logger.warn self.inspect
			Rails.logger.warn self.instance_variables.inspect
			params = "?access_token=" + self.access_token
			Rails.logger.warn "-----KEY, SELF[KEY]:  "
			self.instance_variables.each do |key|
				k = key.to_s[1..-1]
				v = self.instance_variable_get("#{key}")
				params += "&#{k}=#{v}" unless (k == "access_token" || k == "raw_attributes" || k == "id")
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