# coding: utf-8
lib = File.expand_path('../lib', __FILE__)
$LOAD_PATH.unshift(lib) unless $LOAD_PATH.include?(lib)
require 'doctorapi_wrapper/version'

Gem::Specification.new do |spec|
  spec.name          = "doctorapi_wrapper"
  spec.version       = DoctorapiWrapper::VERSION
  spec.authors       = ["Pawel Lewinski", "Piotr Kurek"]
  spec.email         = ["lewy313@gmail.com"]
  spec.summary       = %q{ruby client for goderma doctor api}
  spec.description   = %q{ruby client for goderma doctor api}
  spec.homepage      = ""
  spec.license       = "MIT"

  spec.files         = `git ls-files`.split($/)
  spec.executables   = spec.files.grep(%r{^bin/}) { |f| File.basename(f) }
  spec.test_files    = spec.files.grep(%r{^(test|spec|features)/})
  spec.require_paths = ["lib"]

  spec.add_development_dependency "bundler", "~> 1.5"
  spec.add_development_dependency "rake"
  spec.add_development_dependency "pry"

  spec.add_dependency 'rest-client', '~> 1.6.7'
  spec.add_dependency 'oj', '~> 2.9.0'
  spec.add_dependency 'hashie', '~> 2.0.5'
end
