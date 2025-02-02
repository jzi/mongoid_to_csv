# -*- encoding: utf-8 -*-
$:.push File.expand_path("../lib", __FILE__)
require "mongoid_to_csv/version"

Gem::Specification.new do |s|
  s.name        = "mongoid_to_csv"
  s.version     = MongoidToCSV::VERSION
  s.platform    = Gem::Platform::RUBY
  s.authors     = ["Jared Ning"]
  s.email       = ["jared@redningja.com"]
  s.homepage    = "https://github.com/ordinaryzelig/mongoid_to_csv"
  s.summary     = %q{Simple Mongoid Model to_csv() class method that preserves scopes}
  s.description = %q{Simple Mongoid Model to_csv() class method that preserves scopes}

  s.rubyforge_project = "mongoid_to_csv"

  s.files         = `git ls-files`.split("\n")
  s.test_files    = `git ls-files -- {test,spec,features}/*`.split("\n")
  s.executables   = `git ls-files -- bin/*`.split("\n").map{ |f| File.basename(f) }
  s.require_paths = ["lib"]

  s.add_dependency 'mongoid', '>= 8.1.0'

  s.add_development_dependency 'rspec', '>= 3.0.0'
  s.add_development_dependency 'mongo', '>= 2.0.0'
  s.add_development_dependency 'bson_ext'
end
