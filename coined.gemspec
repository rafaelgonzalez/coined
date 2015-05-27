# coding: utf-8
lib = File.expand_path('../lib', __FILE__)
$LOAD_PATH.unshift(lib) unless $LOAD_PATH.include?(lib)
require 'coined/version'

Gem::Specification.new do |spec|
  spec.name          = "coined"
  spec.version       = Coined::VERSION
  spec.authors       = ["Rafaël Gonzalez"]
  spec.email         = ["rafaelgonzalez@users.noreply.github.com"]
  spec.summary       = "A gem that keeps your coins in a purse"
  spec.description   = "A gem that keeps your coins in a purse"
  spec.homepage      = ""
  spec.license       = "MIT"

  spec.files         = `git ls-files -z`.split("\x0")
  spec.executables   = spec.files.grep(%r{^bin/}) { |f| File.basename(f) }
  spec.test_files    = spec.files.grep(%r{^(test|spec|features)/})
  spec.require_paths = ["lib"]

  spec.add_development_dependency "bundler", "~> 1.7"
  spec.add_development_dependency "rake", "~> 10.0"
end
