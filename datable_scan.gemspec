# coding: utf-8
lib = File.expand_path('../lib', __FILE__)
$LOAD_PATH.unshift(lib) unless $LOAD_PATH.include?(lib)
require 'datable_scan/version'

Gem::Specification.new do |spec|
  spec.name          = 'datable_scan'
  spec.version       = DataBLEScan::VERSION
  spec.authors       = ['Manhattan Perry']
  spec.email         = ['itsmanhattan@gmail.com']
  spec.summary       = %q{Scan for iBeacons nearby.}
  spec.description   = %q{A little Ruby script that converts a raw dump of hcitool ble scan output to a readable log showing nearby iBeacons.}
  spec.homepage      = 'https://github.com/SkuRun/datable_scan#readme'
  spec.license       = 'GPLv3'

  spec.files         = `git ls-files -z`.split("\x0")
  spec.executables   = spec.files.grep(%r{^bin/}) { |f| File.basename(f) }
  spec.test_files    = spec.files.grep(%r{^(test|spec)/})
  spec.require_paths = ['lib']

  spec.add_development_dependency 'bundler', '~> 1.6'
  spec.add_development_dependency 'rake', '~> 10.0'
end
