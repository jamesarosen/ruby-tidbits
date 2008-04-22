RAILS_ROOT = "#{File.dirname(__FILE__)}" unless defined?(RAILS_ROOT)
RAILS_ENV = 'test' unless defined?(RAILS_ENV)
require 'test/unit'
require 'rubygems'
require 'active_record'

$: << File.expand_path(File.join(File.dirname(__FILE__), '..', 'lib'))
$: << File.expand_path(File.join(File.dirname(__FILE__), 'lib'))

require 'database'
require 'schema'