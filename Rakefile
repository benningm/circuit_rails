require 'rake/clean'
require 'rubygems'
require 'rubygems/package_task'
require 'rdoc/task'                                                                       

spec = eval(File.read('circuit_rails.gemspec'))
Gem::PackageTask.new(spec) do |pkg|
end

Rake::RDocTask.new do |rd|
  rd.rdoc_files.include("lib/**/*.rb")
  rd.title = 'Action Mailer adapter for using Circuit in Rails apps.'
end                                                                                       

