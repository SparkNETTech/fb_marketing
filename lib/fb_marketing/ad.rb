module FbMarketing
	class Ad < FbGraph2::Node
		
		register_attributes(
			raw: [ 
				:name,
				:adgroup_status,
				:campaign_id#,
				# :objective, # string
				# :redownload, # bool
			],
			json: [
				:creative
			]
	    )

		def create(options = {})
			self.id = "act_" + self.id + "/adgroups"
			post options
		end

	end
end