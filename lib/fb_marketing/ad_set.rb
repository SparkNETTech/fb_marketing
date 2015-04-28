module FbMarketing
	class AdSet < Node
		
		register_attributes(
			raw: [ 
				:bid_type,
				:campaign_group_id,
				:campaign_status,
				:daily_budget,
				# :is_autobid, # bool
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
	    	#Rails.logger.info "---POST SUPER AD SET: #{self.inspect}"
	    	if attributes.include?(:targeting)
	    		#Rails.logger.info "---Targeting input: #{attributes[:targeting].inspect}"
	    		self.targeting = Struct::Targeting.new(attributes[:targeting]).to_json
	    		#Rails.logger.info "---Targeting structured: #{self.targeting.inspect}"
	    	end
	    	#Rails.logger.info "---FINAL AD SET: #{self.inspect}"
	   end

	   def create(options = {})
	   	self.id = "act_" + self.id + "/adcampaigns"
	   	update options
	   end

	end
end