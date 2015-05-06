module FbMarketing
	class AdSet < Node
		
		register_attributes(
			raw: [ 
				:bid_type,
				:campaign_group_id,
				:campaign_status,
				:daily_budget,
				:is_autobid, # bool
				:lifetime_budget,
				# :redownload, # bool
				:name
			],
			iso8601: [
				:start_time,
				:end_time
			],
			json: [
				:bid_info
			],
			fields: [
				:fields
			],
			custom: [
				:targeting
				# :execution_options, # array
				# :promoted_object,
				#:conversions_specs, # pixels
				#:targeting_specs # pixels
			]
	    )

		def initialize(id, attributes = {})
	    	super
	    	if attributes.include?(:targeting)
	    		self.targeting = Struct::Targeting.new(attributes[:targeting]).to_json
	    	end
	   end

	   def create(options = {})
	   	self.id = "act_" + self.id + "/adcampaigns"
	   	update options
	   end

	   def read_by_ad_campaign(options = {})
	   	self.id = self.id + "/adcampaigns"
	   	read options
	   end

	   def read_by_ad_account(options = {})
	   	self.id = "act_" + self.id + "/adcampaigns"
	   	read options
	   end

	   # CONNECTIONS, append connection name to identifier
	   def adgroups
			self.id = self.id + "/adgroups"
		end
		def adcreatives
			self.id = self.id + "/adcreatives"
		end
		def stats
			self.id = self.id + "/stats"
		end

	end
end