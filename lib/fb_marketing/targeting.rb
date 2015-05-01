module FbMarketing
	class TargetingSearch < Node

		register_attributes(
			raw: [
				:q,
				:type,
				:want_localized_name,
				:list,
				:limit,
				:region_id, # type=adgeolocation
				:country_code, # type=adgeolocation
				:locale, # type=adinterest
				:name, # type=adTargetingCategory
				:id, # type=adTargetingCategory
				:audience_size, # type=adTargetingCategory
				:description, # type=adTargetingCategory
				:class#,  # type=adTargetingCategory
			],
			custom: [
				:location_types, # type=adgeolocation
				:interest_list, #type=adinterestsuggestion
				:path#, # type=adTargetingCategory
			]
		)

		def initialize(id, attributes = {})
	    	super
	    	if attributes.include?(:location_types)
	    		self.location_types = FbGraph2::Collection.new(attributes[:location_types])
	    	end
	    	if attributes.include?(:interest_list)
	    		self.interest_list = FbGraph2::Collection.new(attributes[:interest_list])
	    	end
	    	if attributes.include?(:path)
	    		self.path = FbGraph2::Collection.new(attributes[:path])
	    	end
	   end

	end
end