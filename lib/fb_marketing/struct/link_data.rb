module FbMarketing
	class Struct
		class LinkData < Struct
			register_attributes(
				raw: [
					:link,
					:message,
					# :multi_share_optimized, # bool
					:name,
					:caption,
					:description,
					:picture,
					:image_hash,
				],
				json: [
					:image_crops
				],
				custom: [
					:call_to_action
				]
			)

			class CallToAction < Struct
				register_attributes(
					raw: [:type],
					custom: [:value]
				)

				class Value < Struct
					register_attributes(
						raw: [:link, :link_caption]
					)
				end

				def initialize(attributes = {})
					super
					if attributes.include?(:value)
						self.value = Struct::LinkData::CallToAction::Value.new(attributes[:value])
					end
				end
			end

			def initialize(attributes = {})
				super
				Rails.logger.info "---POST SUPER CallToAction: #{self.inspect}"
				if attributes.include?(:call_to_action)
					self.call_to_action = Struct::LinkData::CallToAction.new(attributes[:call_to_action])
				end
				Rails.logger.info "---END CallToAction INIT: #{self.inspect}"
			end

		end
	end
end