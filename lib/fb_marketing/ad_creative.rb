module FbMarketing
	class AdCreative < FbGraph2::Node
		
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
			custom: [
				:image_crops,
				:object_story_spec,
			]
	   )

		def initialize(id, attributes = {})
	    	super
	    	if attributes.include?(:image_crops)
	    		self.image_crops = {'191x100' => {attributes[:image_crops]}}
	    	end
	    	if attributes.include?(:object_story_spec)
	    		# todo
	    	end
	   end

	end
end