module FbMarketing
	class Struct
		class GeoLocation < Struct
			register_attributes(
				custom: [
					:countries, # array of country codes
					:regions, # array of {key:ids}
					:cities, # array of hashes
					:zips
					#:custom_locations,
					#:geo_markets,
					#:location_types
				]
			)

			class Key < Struct
				register_attributes(
					raw: [:key]
				)
			end

			class City < Struct
				register_attributes(
					raw: [:key, :radius, :distance_unit]
				)
			end

			def initialize(attributes = {})
				super
				Rails.logger.info "---POST SUPER GEOLOCATION: #{self.inspect}"
				if attributes.include?(:countries)
					self.countries = FbGraph2::Collection.new(attributes[:countries])
				end
				if attributes.include?(:regions)
					#self.regions = FbGraph2::Collection.new(attributes[:regions])
					self.regions = FbGraph2::Collection.new(attributes[:regions]).collect! do |param|
						Rails.logger.info "new region: #{param.inspect}"
						region = Struct::GeoLocation::Key.new param
						Rails.logger.info "saved as: #{region.inspect}"
						region
					end
					Rails.logger.info "end of regions collection: #{self.regions.inspect}"
				end
				if attributes.include?(:cities)
					#self.cities = FbGraph2::Collection.new(attributes[:cities])
					self.cities = FbGraph2::Collection.new(attributes[:cities]).collect! do |param|
						Rails.logger.info "new city: #{param.inspect}"
						city = Struct::GeoLocation::City.new param
						Rails.logger.info "saved as: #{city.inspect}"
						city
					end
					Rails.logger.info "end of cities collection: #{self.cities.inspect}"
				end
				if attributes.include?(:zips)
					self.zips = FbGraph2::Collection.new(attributes[:zips]).collect! do |param|
						Key.new param
					end
				end
				Rails.logger.info "---END GEOLOCATION INIT: #{self.inspect}"
			end

		end
	end
end