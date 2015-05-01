module FbMarketing
	class AdAccount < Node
		
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
			],
			fields: [
				:fields
			]
		)

		def initialize(id, attributes = {})
	    	super
	    	self.id = "act_" + self.id
	   end
	   

	   # CONNECTIONS, append connection name to identifier
	   def activities(options = {})
			self.id = self.id + "/activities"
			read options
		end

		def adcampaign_groups(options = {})
			self.id = self.id + "/adcampaign_groups"
			read options
		end

		def adcampaignconversions(options = {})
			self.id = self.id + "/adcampaignconversions"
			read options
		end

		def adcampaigns(options = {})
			self.id = self.id + "/adcampaigns"
			read options
		end

		def adcampaignstats(options = {})
			self.id = self.id + "/adcampaignstats"
			read options
		end

		def adcreatives(options = {})
			self.id = self.id + "/adcreatives"
			read options
		end

		def adgroupconversions(options = {})
			self.id = self.id + "/adgroupconversions"
			read options
		end

		def adgroups(options = {})
			self.id = self.id + "/adgroups"
			read options
		end

		def adgroupstats(options = {})
			self.id = self.id + "/adgroupstats"
			read options
		end

		def adimages(options = {})
			self.id = self.id + "/adimages"
			read options
		end

		def adpreviewscss(options = {})
			self.id = self.id + "/adpreviewscss"
			read options
		end

		def advideos(options = {})
			self.id = self.id + "/advideos"
			read options
		end

		def broadtargetingcategories(options = {})
			self.id = self.id + "/broadtargetingcategories"
			read options
		end

		def connectionobjects(options = {})
			self.id = self.id + "/connectionobjects"
			read options
		end

		def conversions(options = {})
			self.id = self.id + "/conversions"
			read options
		end

		def customaudiences(options = {})
			self.id = self.id + "/customaudiences"
			read options
		end

		def partnercategories(options = {})
			self.id = self.id + "/partnercategories"
			read options
		end

		def ratecard(options = {})
			self.id = self.id + "/ratecard"
			read options
		end

		def reachestimate(options = {})
			self.id = self.id + "/reachestimate"
			read options
		end

		def reportstats(options = {})
			self.id = self.id + "/reportstats"
			read options
		end

		def stats(options = {})
			self.id = self.id + "/stats"
			read options
		end

		def transactions(options = {})
			self.id = self.id + "/transactions"
			read options
		end

		def users(options = {})
			self.id = self.id + "/users"
			read options
		end

	end
end