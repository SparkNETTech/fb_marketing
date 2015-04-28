module FbMarketing
	class Ad < Node

		register_attributes(
			raw: [ 
				:name,
				:adgroup_status,
				:campaign_id
				# :objective, # string
				# :redownload, # bool
			],
			json: [
				:creative
			]
	   )

		def create(options = {})
			self.id = "act_" + self.id + "/adgroups"
			update options
		end

	end
end