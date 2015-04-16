module FbMarketing
	class Node < FbGraph2::Node
		attr_accessor :id, :access_token, :raw_attributes

		def self.inherited(klass)
			Rails.logger.info "---SELF.INHERITED: #{klass.inspect}"
			klass.send :include, AttributeAssigner
			FbMarketing.object_classes << klass
			Rails.logger.info "---fbmarketing object classes: #{FbMarketing.object_classes.inspect}"
		end

		def initialize(id, attributes = {})
			Rails.logger.info "---INITIALIZE: #{id},  ATTR: #{attributes.inspect}"
			self.id = id
			self.raw_attributes = attributes
			assign attributes if respond_to? :assign
			authenticate attributes[:access_token] if attributes.include? :access_token
		end

		def update(options = {})
	   	post options
	   end

		def post(options = {})
			# params = self.compact.attributes.to_query
			Rails.logger.info "-----POSTING, SELF:  "
			Rails.logger.info self.inspect
			Rails.logger.info self.instance_variables.inspect
			params = "?access_token=" + self.access_token
			Rails.logger.info "-----KEY, SELF[KEY]:  "
			self.instance_variables.each do |key|
				k = key.to_s[1..-1]
				v = self.instance_variable_get("#{key}")
				Rails.logger.info k.inspect
				Rails.logger.info v.inspect
				params += "&#{k}=#{v}" unless (k == "access_token" || k == "raw_attributes" || k == "id")
			end
			Rails.logger.info "-----PARAMS:  "
			Rails.logger.info params

			handle_response do
				Rails.logger.info "-----options, build_endpoint, params:"
				Rails.logger.info build_endpoint(options)
				# Rails.logger.info params
				http_client.post build_endpoint(options), params
			end
		end

	end
end