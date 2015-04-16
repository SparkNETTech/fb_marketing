module FbMarketing
  module AttributeAssigner
    include FbGraph2::AttributeAssigner

    def assign(attributes)
      Rails.logger.info "------CLASS: #{self.class}"
      Rails.logger.info "------attribs:  #{attributes.inspect}"
      Array(self.class.registered_attributes).each do |type, keys|
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