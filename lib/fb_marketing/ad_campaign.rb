module FbMarketing
	class AdCampaign < Node
		
		register_attributes(
			raw: [
				:campaign_group_status,
				:name#,
				# :buying_type,
				# :execution_options, # array
				# :objective
			]
	    )

		def initialize(id, attributes = {})
			super
		end

		def create(options = {})
	   	self.id = "act_" + self.id + "/adcampaign_groups"
	   	post options
	   end

	end
end