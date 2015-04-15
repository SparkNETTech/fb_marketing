module FbMarketing
	class Struct
		class ObjectStorySpec < Struct
			register_attributes(
				raw: [
					:page_id
				],
				custom: [
					:link_data#,
					#:photo_data,
					#:video_data,
					#:offer_data,
					#:text_data
				]
			)

			def initialize(attributes = {})
				super
				Rails.logger.info "---POST SUPER OBJSS: #{self.inspect}"
				if attributes.include?(:link_data)
					self.link_data = Struct::LinkData.new(attributes[:link_data])
				end
				Rails.logger.info "---END OBJSS INIT: #{self.inspect}"
			end

		end
	end
end