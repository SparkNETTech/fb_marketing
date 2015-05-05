module FbMarketing
	class TargetingSearch < Node

		register_attributes(
			raw: [
				:q,
				#:type,
				:want_localized_name,
				:list,
				:limit,
				:region_id, # type=adgeolocation
				:country_code, # type=adgeolocation
				:locale, # type=adinterest
				:name, # type=adTargetingCategory
				#:id, # type=adTargetingCategory
				:audience_size, # type=adTargetingCategory
				:description, # type=adTargetingCategory
				:class#,  # type=adTargetingCategory
			],
			simple_array: [
				:countries,
				:regions,
				:cities,
				:zips,
				:location_types, # type=adgeolocation
				:interest_list, #type=adinterestsuggestion
				:path#, # type=adTargetingCategory
			]
		)

		def initialize(id, attributes = {})
	    	super
	    	Rails.logger.error "TARGETING SEARCH: #{self.inspect}"
	    	self.id = "search"
	    	# if attributes.include?(:countries)
	    	# 	self.countries = FbGraph2::Collection.new(attributes[:countries])
	    	# end
	    	# if attributes.include?(:regions)
	    	# 	self.regions = FbGraph2::Collection.new(attributes[:regions])
	    	# end
	    	# if attributes.include?(:cities)
	    	# 	self.cities = FbGraph2::Collection.new(attributes[:cities])
	    	# end
	    	# if attributes.include?(:zips)
	    	# 	self.zips = FbGraph2::Collection.new(attributes[:zips])
	    	# end
	    	# if attributes.include?(:location_types)
	    	# 	self.location_types = FbGraph2::Collection.new(attributes[:location_types])
	    	# end
	    	# if attributes.include?(:interest_list)
	    	# 	self.interest_list = FbGraph2::Collection.new(attributes[:interest_list])
	    	# end
	    	# if attributes.include?(:path)
	    	# 	self.path = FbGraph2::Collection.new(attributes[:path])
	    	# end
	   end

	end
end