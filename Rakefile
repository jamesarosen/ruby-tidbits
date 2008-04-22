require 'rake'
require 'rake/testtask'
require 'rake/rdoctask'
require File.dirname(__FILE__) + '/init'

desc 'Default: run unit tests.'
task :default => 'test:run'

namespace :test do
  
  desc 'Run tests'
  Rake::TestTask.new(:run) do |t|
    t.libs << 'lib' << 'test/lib'
    t.test_files = FileList['test/**/*_test.rb']
    t.verbose = true
  end
  
end