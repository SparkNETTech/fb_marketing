module FbMarketing
	class Struct
		class Targeting < Struct
			register_attributes(
				raw: [
					:age_min,
					:age_max,
				],
				custom: [
					:geo_locations, # hash of arrays of hashes
					:page_types, # array of single string
					:industries, # array of {id, name}
					:genders, # array of int 1 or int 2 or nothing at all as default
					:interests, # array of {id, name}
					:behaviors, # ^
					:connections, # array of ids
					:excluded_connections, # ^
					:friends_of_connections # ^
				]
			)

			class IdName < Struct
				register_attributes(
					raw: [:id, :name]
				)
			end

			def initialize(attributes = {})
				super
				Rails.logger.info "---START TARGETING INIT: #{self.inspect}"
				if attributes.include?(:geo_locations)
					self.geo_locations = Struct::GeoLocation.new(attributes[:geo_locations])
				end
				if attributes.include?(:page_types)
					self.page_types = FbGraph2::Collection.new(attributes[:page_types])
				end
				if attributes.include?(:industries)
					self.industries = FbGraph2::Collection.new(attributes[:industries]).collect! do |param|
						IdName.new param
					end
				end
				if attributes.include?(:genders)
					self.genders = FbGraph2::Collection.new(attributes[:genders])
				end
				if attributes.include?(:interests)
					self.interests = FbGraph2::Collection.new(attributes[:interests]).collect! do |param|
						IdName.new param
					end
				end
				if attributes.include?(:behaviors)
					self.behaviors = FbGraph2::Collection.new(attributes[:behaviors]).collect! do |param|
						IdName.new param
					end
				end
				if attributes.include?(:connections)
					self.connections = FbGraph2::Collection.new(attributes[:connections])
				end
				if attributes.include?(:excluded_connections)
					self.excluded_connections = FbGraph2::Collection.new(attributes[:excluded_connections])
				end
				if attributes.include?(:friends_of_connections)
					self.friends_of_connections = FbGraph2::Collection.new(attributes[:friends_of_connections])
				end
				Rails.logger.info "---END TARGETING INIT: #{self.inspect}"
			end

		end
	end
end