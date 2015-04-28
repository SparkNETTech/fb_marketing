module FbMarketing
	class AdCreative < Node
		
		register_attributes(
			raw: [
				:name,
				:title,
				:body,
				:object_url,
				:image_file,
				:image_hash,
				:actor_id,
				# :follow_redirect, # bool
				:object_id,
				:object_story_id,
				:link_url,
				:url_tags
			],
			json: [
				:image_crops
			],
			custom: [
				:object_story_spec
			]
	   )

		def initialize(id, attributes = {})
	    	super
	    	if attributes.include?(:object_story_spec)
	    		# Rails.logger.info "---OBJSS input: #{attributes[:object_story_spec].inspect}"
	    		self.object_story_spec = Struct::ObjectStorySpec.new(attributes[:object_story_spec]).to_json
	    		# Rails.logger.info "---OBJSS structured: #{self.object_story_spec.inspect}"
	    	end
	   end

	   def create(options = {})
	   	self.id = "act_" + self.id + "/adcreatives"
	   	update options
	   end

	end
end