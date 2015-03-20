module FbMarketing
	class Struct < FbGraph2::Struct
		class Creative < Struct
			register_attributes(
				raw: [:creative_id]
			)
		end
	end
end