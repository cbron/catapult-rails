# coding: utf-8
lib = File.expand_path('../lib', __FILE__)
$LOAD_PATH.unshift(lib) unless $LOAD_PATH.include?(lib)
require 'catapult/version'

Gem::Specification.new do |spec|
  spec.name          = "catapult-rails"
  spec.version       = Catapult::VERSION
  spec.authors       = ["cbron"]
  spec.email         = ["x@x.com"]
  spec.description   = %q{Ruby wrapper for the Vibes Catapult api}
  spec.summary       = %q{Wraps the catapult api, which is used for marketing, such as text message subscriptions.}
  spec.homepage      = ""
  spec.license       = "MIT"

  spec.files         = `git ls-files`.split($/)
  spec.executables   = spec.files.grep(%r{^bin/}) { |f| File.basename(f) }
  spec.test_files    = spec.files.grep(%r{^(test|spec|features)/})
  spec.require_paths = ["lib"]

  spec.add_development_dependency "bundler", "~> 1.3"
  spec.add_development_dependency "rake"
  # spec.add_development_dependency "nokogiri"
end
