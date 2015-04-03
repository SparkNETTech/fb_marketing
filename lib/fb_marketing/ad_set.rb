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
	    		# just using our set one for now
	    		self.bid_info = attributes[:bid_info]
	    		puts "FB MARKETING BID INFO OUTPUT: #{self.bid_info}"
	    	end
	    	if attributes.include?(:targeting)
	    		# todo
	    		self.targeting = attributes[:targeting]
	    		puts "FB MARKETING TARGETING OUTPUT: #{self.targeting}"
	    	end
	    	if attributes.include?(:start_time)
	    		self.start_time = Time.parse(attributes[:start_time]).iso8601
	    	end
	    	if attributes.include?(:end_time)
	    		self.end_time = Time.parse(attributes[:end_time]).iso8601
	    	end
	    end

	end
end