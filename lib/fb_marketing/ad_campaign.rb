module FbMarketing
	class AdCampaign < Node
		
		register_attributes(
			raw: [
				:campaign_group_status,
				:name#,
				# :buying_type,
				# :execution_options, # array
				# :objective
			]
	    )

		def create_to_fb(options = {})
	   	Rails.logger.info "-------create to fb: self:  #{self.inspect}"
	   	self.id = "act_" + self.id + "/adcampaign_groups"
	   	# params = ""
	   	# params += "?campaign_group_status=" + self.campaign_group_status.to_s if self.campaign_group_status
	   	# params += "&name=" + self.name if self.name
	   	# Rails.logger.info "-------params:  #{params}"
	   	update options#, params
	   end

	   def update_to_fb(options = {})
	   	Rails.logger.info "-------update to fb: self:  #{self.inspect}"
	   	# params = ""
	   	# params += "?campaign_group_status=" + self.campaign_group_status.to_s if self.campaign_group_status
	   	# params += "&name=" + self.name if self.name
	   	# Rails.logger.info "-------params:  #{params}"
	   	update options#, params
	   end

	end
end