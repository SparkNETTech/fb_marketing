module FbMarketing
	class Node < FbGraph2::Node

		# override update because it isnt parsing the parameters correctly
		# def update(options = {}, params)
		# 	post options, params
		# end

		# protected
		# def post(options = {}, params)
		# 	handle_response do
		# 		http_client.post build_endpoint(options), params
		# 	end
		# end

	end
end