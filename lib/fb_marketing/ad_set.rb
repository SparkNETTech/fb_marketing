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
				:name,
				# :redownload, # bool
			],
			# looks like fbgraph2 does time as %m/%d/%Y, we need iso8601
			# time: [ 
			# 	:start_time, 
			# 	:end_time	
			# ],
			custom: [
				:start_time, 
				:end_time,
				:bid_info, 
				# :execution_options, # array
				# :promoted_object,
				:targeting
			]
	    )

		def initialize(id, attributes = {})
	    	super
	    	if attributes.include?(:bid_info)
	    		# todo
	    	end
	    	if attributes.include?(:targeting)
	    		# todo
	    	end
	    	if attributes.include?(:start_time)
	    		self.start_time = attributes[:start_time].iso8601
	    	end
	    	if attributes.include?(:end_time)
	    		self.end_time = attributes[:end_time].iso8601
	    	end
	    end

	end
end