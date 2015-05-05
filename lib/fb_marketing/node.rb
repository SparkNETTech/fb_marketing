module FbMarketing
	class Node < FbGraph2::Node
		attr_accessor :id, :access_token, :raw_attributes
		alias_method :identifier, :id

		def self.inherited(klass)
			klass.send :include, AttributeAssigner
			FbMarketing.object_classes << klass
		end

		def initialize(id, attributes = {})
			Rails.logger.info "---INITIALIZE: #{id},  ATTR: #{attributes.inspect}"
			Rails.logger.info "---------fbmarketing object classes: #{FbMarketing.object_classes.inspect}"
			Rails.logger.info "------self: #{self.inspect}, class: #{self.class.inspect}"
			self.id = id
			self.raw_attributes = attributes
			assign attributes if respond_to? :assign
			authenticate attributes[:access_token] if attributes.include? :access_token
		end

		def create(options = {})
			post options
		end

		def read(options = {})
			get options
		end

		def update(options = {})
	   	post options
	   end

	   def destroy(options = {})
	   	destroy options
	   end

	   protected

	   def get(options = {})
			handle_response do
				http_client.get build_endpoint(options), build_params
			end
		end

		def post(options = {})
			handle_response do
				http_client.post build_endpoint(options), build_params
			end
		end

		def delete(options = {})
			handle_response do
				http_client.delete build_endpoint(options), build_params
			end
		end

		private

		def build_params
			Rails.logger.info "-----BUILD PARAMS, SELF:  "
			Rails.logger.info self.inspect
			Rails.logger.info self.instance_variables.inspect
			params = ""
			Rails.logger.info "-----KEY, SELF[KEY]:  "
			self.instance_variables.each do |key|
				k = key.to_s[1..-1]
				v = self.instance_variable_get("#{key}")
				Rails.logger.info k.inspect
				Rails.logger.info v.inspect
				if k == "fields"
					Rails.logger.info v.join(',')
					params = "&fields=" + v.join(',').to_s
					next
				end
				if k.start_with?("reserved_")
              k = k[9..-1]
            end
				params += "&#{k}=#{v}" unless (k == "access_token" || k == "raw_attributes" || k == "id")
			end
			params = params.insert(0, "?access_token=" + self.access_token)
			Rails.logger.info "----END PARAMS/FIELDS: #{params}"
			return params
		end

		def build_endpoint(options = {})
			Rails.logger.error "BUILDING ENDPOINT"
			File.join [
				File.join(
					FbMarketing.root_url,
					options[:api_version] || FbMarketing.api_version,
					id.to_s
				),
				options[:edge],
				FbGraph2::Util.as_identifier(options[:edge_scope])
			].compact.collect(&:to_s)
		end

	end
end