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
            raw = attributes[key]
            value = case type
            when :raw
              raw
            when :int_flag
              raw == 1
            else
              next
            end
            self.send :"#{key}=", value
          end
        end
      end
    end

  end
end