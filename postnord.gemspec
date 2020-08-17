# coding: utf-8
lib = File.expand_path('../lib', __FILE__)
$LOAD_PATH.unshift(lib) unless $LOAD_PATH.include?(lib)
require 'postnord/version'

Gem::Specification.new do |spec|
  spec.name          = "postnord"
  spec.version       = Postnord::VERSION
  spec.authors       = ["Stefan Åhman"]
  spec.email         = ["stefan.ahman@apoex.se"]

  spec.summary       = %q{A gem for Postnord's API}
  spec.homepage      = 'https://github.com/apoex/postnord'
  spec.license       = "MIT"

  spec.files         = `git ls-files -z`.split("\x0").reject { |f| f.match(%r{^(test|spec|features)/}) }
  spec.bindir        = "exe"
  spec.executables   = spec.files.grep(%r{^exe/}) { |f| File.basename(f) }
  spec.require_paths = ["lib"]

  spec.add_dependency 'faraday'
  spec.add_development_dependency "webmock"
  spec.add_development_dependency "bundler"
  spec.add_development_dependency "rake", ">= 10.0"
  spec.add_development_dependency "rspec", "~> 3.0"
  spec.add_development_dependency "simplecov", "~> 0.19.0"
end
