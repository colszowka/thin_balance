# -*- encoding: utf-8 -*-
$:.push File.expand_path("../lib", __FILE__)
require "thin_balance/version"

Gem::Specification.new do |s|
  s.name        = "thin_balance"
  s.version     = ThinBalance::VERSION
  s.platform    = Gem::Platform::RUBY
  s.authors     = ["Christoph Olszowka"]
  s.email       = ["christoph at olszowka de"]
  s.homepage    = "https://github.com/colszowka/thin_balance"
  s.summary     = %q{Run multiple thin instances of your app load-balanced using pen in development}
  s.description = %q{Run multiple thin instances of your app load-balanced using pen in development}


  s.add_dependency 'thin', '>= 1.2'
  s.add_dependency 'mixlib-cli', "~> 1.2"
  s.add_dependency 'term-ansicolor', '>= 1.0.0'
  
  s.bindir = 'bin'
  s.default_executable = 'thin_balance'
  
  s.rubyforge_project = "thin_balance"

  s.files         = `git ls-files`.split("\n")
  s.test_files    = `git ls-files -- {test,spec,features}/*`.split("\n")
  s.executables   = `git ls-files -- bin/*`.split("\n").map{ |f| File.basename(f) }
  s.require_paths = ["lib"]
end
