module FbMarketing
	class AdCampaign < Node
		
		register_attributes(
			raw: [
				:campaign_group_status,
				:name,
				# :buying_type,
				# :execution_options, # array
				:objective
			],
			fields: [
				:fields
			]
	   )

		def create(options = {})
	   	self.id = "act_" + self.id + "/adcampaign_groups"
	   	update options
	   end

	   def read_by_ad_account(options = {})
	   	self.id = "act_" + self.id + "/adcampaign_groups"
	   	read options
	   end

	   # CONNECTIONS, append connection name to identifier
	   def adcampaigns(options = {})
			self.id = self.id + "/adcampaigns"
			read options
		end
		def adgroups(options = {})
			self.id = self.id + "/adgroups"
			read options
		end
		def stats(options = {})
			self.id = self.id + "/stats"
			read options
		end

	end
end