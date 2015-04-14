module FbMarketing
	class Node < FbGraph2::Node

		def update(options = {}, params)
			handle_response do
				Rails.logger.warn("-----options, build_endpoint, params:")
				Rails.logger.warn(options.inspect)
				Rails.logger.warn(build_endpoint(options))
				Rails.logger.warn(params)
				http_client.post build_endpoint(options), params
			end
		end

	end
end