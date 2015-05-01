module FbMarketing
	class Ad < Node

		register_attributes(
			raw: [ 
				:name,
				:adgroup_status,
				:campaign_id
				# :objective, # string
				# :redownload, # bool
			],
			json: [
				:creative
			],
			fields: [
				:fields
			]
	   )

		def create(options = {})
			self.id = "act_" + self.id + "/adgroups"
			update options
		end

		def read_by_ad_set(options = {})
	   	self.id = self.id + "/adgroups"
	   	read options
	   end

	   def read_by_ad_campaign(options = {})
	   	self.id = self.id + "/adgroups"
	   	read options
	   end

	   def read_by_ad_account(options = {})
	   	self.id = "act_" + self.id + "/adgroups"
	   	read options
	   end

	   # CONNECTIONS, append connection name to identifier
	   def adcreatives(options = {})
			self.id = self.id + "/adcreatives"
			read options
		end
		def keywordstats(options = {})
			self.id = self.id + "/keywordstats"
			read options
		end
		def previews(options = {})
			self.id = self.id + "/previews"
			read options
		end
		def reachestimate(options = {})
			self.id = self.id + "/reachestimate"
			read options
		end
		def stats(options = {})
			self.id = self.id + "/stats"
			read options
		end
		def targetingsentencelines(options = {})
			self.id = self.id + "/targetingsentencelines"
			read options
		end
		def trackingtag(options = {})
			self.id = self.id + "/trackingtag"
			read options
		end
		def conversions(options = {})
			self.id = self.id + "/conversions"
			read options
		end

	end
end