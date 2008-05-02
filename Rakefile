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

namespace :doc do
  
  desc 'Cleans documentation'
  task :clean => :clobber_generate
  
  Rake::RDocTask.new(:generate) do |rdoc|
    rdoc.rdoc_dir = 'doc'
    rdoc.title    = "Rcal Documentation"
    rdoc.rdoc_files.include('lib/**/*.rb')
    rdoc.rdoc_files.include('README.txt')
    rdoc.options << '--line-numbers'
    rdoc.options << '--inline-source'
    rdoc.options << '--main' << 'README.txt'
  end
end