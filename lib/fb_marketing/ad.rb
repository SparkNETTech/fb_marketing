module FbMarketing
	class Ad < FbGraph2::Node
		
		register_attributes(
			raw: [ 
				:name,
				:adgroup_status,
				:campaign_id#,
				# :objective, # string
				# :redownload, # bool
			],
			custom: [
				#:bid_info,
				:creative#,
				# :conversion_specs, # json object
				# :tracking_specs, # object
				# :social_prefs # array of string values
			]
	    )

	    def initialize(id, attributes = {})
	    	super
	    	if attributes.include?(:creative)
	    		self.creative = Struct::Creative.attributes[:creative]
	    	end
	    end

	end
end