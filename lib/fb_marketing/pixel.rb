module FbMarketing
	class Pixel < FbGraph2::Node
		
		register_attributes(
			raw: [
				:id,
				:name,
				:tag,
				:value
			]
	    )

	end
end