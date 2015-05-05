module FbMarketing
  module AttributeAssigner
    extend ActiveSupport::Concern

    included do
      extend ClassMethodsTest
      attr_accessor :raw_attributes
      cattr_accessor :registered_attributes_test
    end

    module ClassMethodsTest
      def register_attributes(attributes)
        self.registered_attributes_test = attributes
        send :attr_accessor, *attributes.values.flatten
      end
    end

    def assign(attributes)
      Rails.logger.info "------CLASS: #{self.class}"
      Rails.logger.info "------attribs:  #{attributes.inspect}"
      Rails.logger.info "------registered: #{self.class.registered_attributes_test.inspect}"
      Array(self.class.registered_attributes_test).each do |type, keys|
        Rails.logger.info "-------START ASSIGN: #{type}, #{keys.inspect}"
        keys.each do |key|
          Rails.logger.info "-----KEY: #{key}"
          if attributes.include? key
            Rails.logger.info "---KEY INCLUDED: #{attributes[key]}"
            raw = attributes[key]
            value = case type
            when :raw
              raw
            when :int_flag
              raw == 1
            when :json 
              raw.to_json
            when :iso8601
              if raw == 0 # catch end_time of 0 (FB default for no end_time)
                0
              else
                DateTime.parse(raw.to_s).iso8601.to_s
              end
            when :unix_time
              DateTime.parse(raw.to_s).to_time.to_i.to_s
            when :simple_array
              FbGraph2::Collection.new(raw)
            when :fields
              FbGraph2::Collection.new(raw)
            else
              next
            end
            if key.to_s.start_with?("reserved_")
              key = key.to_s[8..-1]
            end
            Rails.logger.info "---KEY:VALUE: #{key}: #{value}"
            self.send :"#{key}=", value
          end
        end
      end
    end

  end
end