module FbMarketing
	class AdStatistics < Node
		
		# to do, separate specific types?
		register_attributes(
			unix_time: [
				:start_time,
				:end_time
			],
			ids: [
				:ids
			],
			fields: [
				:fields
			]
		)

		def read_by_ad_account(options = {})
	   	self.id = "act_" + self.id + "/stats"
	   	read options
	   end

	   def read_by_ids(options = {})
	   	self.id = "/stats"
	   	read options
	   end

	   def read_by_ad_campaign(options = {})
	   	self.id = self.id + "/stats"
	   	read options
	   end

	   def read_by_ad_sets(options = {})
	   	self.id = "act_" + self.id + "/adcampaignstats"
	   	read options
	   end

	   def read_by_ad_set(options = {})
	   	self.id = self.id + "/stats"
	   	read options
	   end

	   def read_by_ad_group(options = {})
	   	self.id = self.id + "/stats"
	   	read options
	   end

	end
end