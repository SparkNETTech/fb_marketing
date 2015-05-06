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
			fields: [
				:fields
			],
			custom: [
				:object_story_spec
			]
	   )

		def initialize(id, attributes = {})
	    	super
	    	if attributes.include?(:object_story_spec)
	    		self.object_story_spec = Struct::ObjectStorySpec.new(attributes[:object_story_spec])
	    	end
	   end

	   def create(options = {})
	   	self.id = "act_" + self.id + "/adcreatives"
	   	update options
	   end

	   def read_by_ad_set(options = {})
	   	self.id = self.id + "/adcreatives"
	   	read options
	   end

	   def read_by_ad_account(options = {})
	   	self.id = "act_" + self.id + "/adcreatives"
	   	read options
	   end

	end
end