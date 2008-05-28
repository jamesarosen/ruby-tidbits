# an init.rb file so the project can act like a Rails plugin
if ENV['RAILS_ENV']
  require File.join(File.dirname(__FILE__), 'lib', 'tidbits', 'rails')
  ActiveRecord::Base.send :include, Tidbits::ActiveRecord::ValidatesEmail
  ActiveRecord::Base.send :include, Tidbits::ActiveRecord::ValidatesUri
end