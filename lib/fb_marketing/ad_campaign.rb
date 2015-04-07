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

	end
end