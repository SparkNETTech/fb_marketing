module FbMarketing
	class AdAccount < FbGraph2::Node
		
		# to do, separate specific types?
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

	end
end