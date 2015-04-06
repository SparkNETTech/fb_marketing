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
				if attributes.include?(:geo_locations)
					self.geo_locations = Struct::GeoLocations.new(attributes[:geo_locations])
				end
				if attributes.include?(:page_types)
					self.page_types = Collection.new([attributes[:page_types]])
				end
				if attributes.include?(:industries)
					self.industries = Collection.new(attributes[:industries]).collect! do |param|
						IdName.new param
					end
				end
				if attributes.include?(:genders)
					self.genders = Collection.new([attributes[:genders]])
				end
				if attributes.include?(:interests)
					self.interests = Collection.new(attributes[:interests]).collect! do |param|
						IdName.new param
					end
				end
				if attributes.include?(:behaviors)
					self.behaviors = Collection.new(attributes[:behaviors]).collect! do |param|
						IdName.new param
					end
				end
				if attributes.include?(:connections)
					self.connections = Collection.new(attributes[:connections])
				end
				if attributes.include?(:excluded_connections)
					self.excluded_connections = Collection.new(attributes[:excluded_connections])
				end
				if attributes.include?(:friends_of_connections)
					self.friends_of_connections = Collection.new(attributes[:friends_of_connections])
				end
			end

		end
	end
end