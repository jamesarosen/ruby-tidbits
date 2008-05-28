require 'tidbits/active_record/validates_email'
require 'tidbits/active_record/validates_uri'
ActiveRecord::Base.send :include, Tidbits::ActiveRecord::ValidatesEmail
ActiveRecord::Base.send :include, Tidbits::ActiveRecord::ValidatesUri

module Tidbits
  module Rails
  end
end