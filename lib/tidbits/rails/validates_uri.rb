require 'uri'

module Tidbits
  module Rails
    module ValidatesUri
      def self.included(base)
        base.extend Tidbits::Rails::ValidatesUri::ClassMethods
      end
      
      module ClassMethods
        def validates_uri(*attr_names)
          options = attr_names.extract_options!.symbolize_keys!
          configuration = { :message => "is not a valid URI", :on => :save, :protocols => ['HTTP', 'HTTPS']  }
          configuration.update(options)
          configuration[:protocols] = configuration[:protocols].map {|p| p.to_s.upcase}
          validates_each(attr_names, configuration) do |r, a, v|
            unless v.nil?
              begin
                u = URI.parse(v)
                unless u.scheme and configuration[:protocols].include?(u.scheme.upcase)
                  r.errors.add(a, configuration[:message]) and false
                end
              rescue URI::InvalidURIError  
                r.errors.add(a, configuration[:message]) and false
              end
            end
          end
        end
      end
      
    end
  end
end