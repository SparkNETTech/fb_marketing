module FbMarketing
	class Struct
		class BidInfo < Struct
			register_attributes(
				raw: [
					:CLICKS
					#:IMPRESSIONS,
					#:ACTIONS,
					#:REACH,
					#:CLICKS,
					#:SOCIAL
				]
			)

			# def initialize(attributes = {})
			# 	if attributes.include?(:CLICKS)
			# 		self.CLICKS = attributes[:CLICKS].to_json
			# 	end
			# end

		end
	end
end