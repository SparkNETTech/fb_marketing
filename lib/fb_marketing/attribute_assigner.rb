module FbMarketing
  module AttributeAssigner
    extend ActiveSupport::Concern

    included do
      extend ClassMethods
      attr_accessor :raw_attributes
      cattr_accessor :registered_attributes
    end

    module ClassMethods
      def register_attributes(attributes)
        self.registered_attributes = attributes
        send :attr_accessor, *attributes.values.flatten
      end
    end

    def assign(attributes)
      Array(self.class.registered_attributes).each do |type, keys|
        keys.each do |key|
          if attributes.include? key
            Rails.logger.info "---KEY: #{key}: #{attributes[key]}"
            raw = attributes[key]
            value = case type
            when :raw
              raw
            when :int_flag
              raw == 1
            when :json 
              raw.as_json
            when :iso8601
              if raw == 0 # catch end_time of 0 (FB default for no end_time)
                0
              else
                DateTime.parse(raw.to_s).iso8601.to_s
              end
            else
              next
            end
            Rails.logger.info "---VALUE: #{value}"
            self.send :"#{key}=", value
          end
        end
      end
    end

  end
end