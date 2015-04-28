module FbMarketing
	class AdAccount < FbGraph2::Node
		
		register_attributes(
			raw: [
				:account_id,
				:name,
				:account_status,
				:daily_spend_limit,
				:users,
				:currency,
				:timezone_id,
				:timezone_name,
				:capabilities,
				:account_groups,
				:is_personal,
				:business_name,
				:business_street,
				:business_street2,
				:business_city,
				:business_state,
				:business_zip,
				:business_country_code,
				:vat_status,
				:agency_client_declaration,
				:spend_cap,
				:amount_spent
			]
		)

		def fetch_account_info(options = {}, params = {})
	   	self.id = "act_" + self.id
	   	fetch options, params
	   end

		def fetch_user_connection_objects(options = {}, params = {})
			self.id = "act_" + self.id + "/connectionobjects"
			Rails.logger.error "------self id: #{self.id}"
			fetch options, params
		end

	end
end