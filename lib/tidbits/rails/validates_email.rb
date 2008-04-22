module Tidbits
  module Rails
    module ValidatesEmail
      def self.included(base)
        base.extend Tidbits::Rails::ValidatesEmail::ClassMethods
      end
      
      module ClassMethods
        def validates_email(*attr_names)
          options = attr_names.extract_options!.symbolize_keys!
          configuration = { :on => :save, :message => ActiveRecord::Errors.default_error_messages[:invalid], :with => Tidbits::Rails::ValidatesEmail::EmailAddressRegex }
          configuration.update(options)
          attr_names = [:email] if attr_names.nil? or attr_names.empty?
          raise ArgumentError.new(':with must be a regular expression') unless configuration[:with].is_a?(Regexp)
          validates_each(attr_names, configuration) do |r, a, v|
            r.errors.add(a, configuration[:message]) unless v.nil? or v.to_s =~ configuration[:with]
          end
        end
      end
    
      unless const_defined?('EmailAddressRegex')
        EmailAddressRegex = begin
          qtext = '[^\\x0d\\x22\\x5c\\x80-\\xff]'
          dtext = '[^\\x0d\\x5b-\\x5d\\x80-\\xff]'
          atom = '[^\\x00-\\x20\\x22\\x28\\x29\\x2c\\x2e\\x3a-' +
            '\\x3c\\x3e\\x40\\x5b-\\x5d\\x7f-\\xff]+'
          quoted_pair = '\\x5c[\\x00-\\x7f]'
          domain_literal = "\\x5b(?:#{dtext}|#{quoted_pair})*\\x5d"
          quoted_string = "\\x22(?:#{qtext}|#{quoted_pair})*\\x22"
          domain_ref = atom
          sub_domain = "(?:#{domain_ref}|#{domain_literal})"
          word = "(?:#{atom}|#{quoted_string})"
          domain = "#{sub_domain}(?:\\x2e#{sub_domain})*"
          local_part = "#{word}(?:\\x2e#{word})*"
          addr_spec = "#{local_part}\\x40#{domain}"
          pattern = /\A#{addr_spec}\z/
        end
      end
      
    end
  end
end