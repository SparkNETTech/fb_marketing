module FbMarketing
	class Struct < FbGraph2::Struct
		class BidInfo < Struct
			register_attributes(
				raw: [
					:CLICKS,
					:IMPRESSIONS,
					:ACTIONS,
					:REACH,
					:CLICKS,
					:SOCIAL
				]
			)
		end
	end
end