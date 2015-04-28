module FbMarketing
	class AdStatistic < Node
		
		# to do, separate specific types?
		register_attributes(
			unix_time: [
				:start_time,
				:end_time
			]
		)

		def fetch_stats(options = {}, params = {})
			self.id = self.id + "/stats"
	   	fetch options, params
		end

		def fetch_stats_by_ad_set(options = {}, params = {})
			self.id = "act_" + self.id + "/adcampaignstats"
	   	fetch options, params
		end

	end
end