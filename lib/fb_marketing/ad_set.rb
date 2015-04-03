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
			]
	    )

		def initialize(id, attributes = {})
	    	super
	    	if attributes.include?(:bid_info)
	    		# todo
	    		self.bid_info = attributes[:bid_info]
	    	end
	    	if attributes.include?(:targeting)
	    		# todo
	    		self.targeting = attributes[:targeting].as_json
	    	end
	    	if attributes.include?(:start_time)
	    		self.start_time = (attributes[:start_time].to_s).iso8601
	    	end
	    	if attributes.include?(:end_time)
	    		if attributes[:end_time] == 0
	    			self.end_time = 0
	    		else
	    			self.end_time = (attributes[:end_time].to_s).iso8601
	    		end
	    	end
	    end

	end
end