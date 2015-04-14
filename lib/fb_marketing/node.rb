module FbMarketing
	class Node < FbGraph2::Node

		def update(endpoint, params)
			handle_response do
				http_client.post endpoint, params
			end
		end

	end
end