module FbMarketing
	class AdSet < FbGraph2::Node
		
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
			# looks like fbgraph2 does time as %m/%d/%Y, we need iso8601 or unixtimestamp
			# time: [ 
			# 	:start_time, 
			# 	:end_time	
			# ],
			custom: [
				:bid_info,
				:start_time,
				:end_time,
				# :execution_options, # array
				# :promoted_object,
				:targeting
				#:conversions_specs, # pixels
				#:targeting_specs # pixels
			]
	    )

		def initialize(id, attributes = {})
	    	super
	    	if attributes.include?(:bid_info)
	    		Rails.logger.info attributes[:bid_info]
	    		self.bid_info = Struct::BidInfo.new(attributes[:bid_info])
	    		#self.bid_info = attributes[:bid_info]
	    		Rails.logger.info self.bid_info.inspect
	    	end
	    	if attributes.include?(:targeting)
	    		Rails.logger.info attributes[:targeting]
	    		self.targeting = Struct::Targeting.new(attributes[:targeting])
	    		Rails.logger.info self.targeting.inspect
	    	end
	    	if attributes.include?(:start_time)
	    		self.start_time = DateTime.parse(attributes[:start_time].to_s).iso8601.to_s
	    	end
	    	if attributes.include?(:end_time)
	    		if attributes[:end_time] == 0
	    			self.end_time = 0
	    		else
	    			self.end_time = DateTime.parse(attributes[:end_time].to_s).iso8601.to_s
	    		end
	    	end
	    end

	end
end