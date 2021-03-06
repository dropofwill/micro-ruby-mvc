# coding: utf-8
lib = File.expand_path('../lib', __FILE__)
$LOAD_PATH.unshift(lib) unless $LOAD_PATH.include?(lib)
require 'rulers/version'

Gem::Specification.new do |spec|
  spec.name          = "rulers"
  spec.version       = Rulers::VERSION
  spec.authors       = ["Will Paul"]
  spec.email         = ["wpaul@globalthinking.com"]
  spec.summary       = %q{Rulers a ruby micro web framework}
  spec.description   = %q{Rulers a ruby micro web framework, which uses Rack}
  spec.license       = "GNU GPL"

  spec.files         = `git ls-files -z`.split("\x0")
  spec.executables   = spec.files.grep(%r{^bin/}) { |f| File.basename(f) }
  spec.test_files    = spec.files.grep(%r{^(test|spec|features)/})
  spec.require_paths = ["lib"]

  spec.add_development_dependency "bundler", "~> 1.6"
  spec.add_development_dependency "rake", "~> 10.3"
  spec.add_development_dependency "rack-test", "~> 0.6"
  spec.add_development_dependency "test-unit", "~> 2.5"

  spec.add_runtime_dependency "rack", "~> 1.0"
  spec.add_runtime_dependency "slim", "~> 2"
  spec.add_runtime_dependency "multi_json", "~> 1.10"
end