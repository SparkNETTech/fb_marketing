module FbMarketing
	class Struct < FbGraph2::Struct
		class Targeting < Struct
			register_attributes(
				raw: [
					:age_min,
					:age_max,
				],
				custom: [
					:geo_locations, #hash
					:page_types, #array of single string
					:industries,
					:genders, #array of int 1 or int 2 or nothing at all as default
					:interests, # array of objects of :id, :name
					:behaviors, # ^
					:connections, # array of ids
					:excluded_connections, #^
					:friends_of_connections #^
				]
			)

			# def initialize(attributes = {})
			# 	if attributes.include?(:geo_locations)
			# 		self.geo_locations =
			# 	end
			# 	if attributes.include?(:page_types)
			# 		self. = 
			# 	end
			# 	if attributes.include?(:industries)
			# 		self. = 
			# 	end
			# 	if attributes.include?(:genders)
			# 		self. = 
			# 	end
			# 	if attributes.include?(:interests)
			# 		self. = 
			# 	end
			# 	if attributes.include?(:behaviors)
			# 		self. = 
			# 	end
			# 	if attributes.include?(:connections)
			# 		self. = 
			# 	end
			# 	if attributes.include?(:excluded_connections)
			# 		self. = 
			# 	end
			# 	if attributes.include?(:friends_of_connections)
			# 		self. = 
			# 	end
			# end

			# class GeoLocations < Struct
			# 	register_attributes(

			# 	)
			# end

			# class PageTypes < Struct
			# 	register_attributes(
					
			# 	)
			# end

			# class Industries < Struct
			# 	register_attributes(
					
			# 	)
			# end

			# class Genders < Struct
			# 	register_attributes(
					
			# 	)
			# end

			# class GeoLocations < Struct
			# 	Interests(
					
			# 	)
			# end

			# class Behaviors < Struct
			# 	register_attributes(
					
			# 	)
			# end

			# class ExcludedConnections < Struct
			# 	register_attributes(
					
			# 	)
			# end

			# class Connections < Struct
			# 	register_attributes(
					
			# 	)
			# end

			# class FriendsOfConnections < Struct
			# 	register_attributes(
					
			# 	)
			# end

		end
	end
end