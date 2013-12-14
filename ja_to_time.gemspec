# coding: utf-8
lib = File.expand_path('../lib', __FILE__)
$LOAD_PATH.unshift(lib) unless $LOAD_PATH.include?(lib)
require 'ja_to_time/version'

Gem::Specification.new do |spec|
  spec.name          = "ja_to_time"
  spec.version       = JaToTime::VERSION
  spec.authors       = ["Manbo-"]
  spec.email         = ["Manbo-@server.fake"]
  spec.description   = %q{convert japanese time format strings to time}
  spec.summary       = %q{convert japanese time format strings to time}
  spec.homepage      = ""
  spec.license       = "MIT"

  spec.files         = `git ls-files`.split($/)
  spec.executables   = spec.files.grep(%r{^bin/}) { |f| File.basename(f) }
  spec.test_files    = spec.files.grep(%r{^(test|spec|features)/})
  spec.require_paths = ["lib"]

  spec.add_dependency "moji"
  spec.add_dependency "activesupport", "> 3"

  spec.add_development_dependency "bundler", "~> 1.3"
  spec.add_development_dependency "rake"

  spec.add_development_dependency "rspec"
end
