# coding: utf-8
lib = File.expand_path('../lib', __FILE__)
$LOAD_PATH.unshift(lib) unless $LOAD_PATH.include?(lib)
require 'crafty_clicks/version'

Gem::Specification.new do |spec|
  spec.name          = 'craftyclicks-ruby'
  spec.version       = CraftyClicks::VERSION
  spec.authors       = ['Joseph Southan']
  spec.email         = ['joe+github@sthn.io']

  spec.summary       = 'A simple wrapper around the CraftClicks API'
  spec.homepage      = 'https://www.github.com/JoeSouthan/craftyclicks-ruby'
  spec.license       = 'MIT'
  spec.required_ruby_version = '>= 2.1'

  spec.metadata['allowed_push_host'] = 'https://rubygems.org'

  spec.files = `git ls-files -z`.split("\x0").reject do |f|
    f.match(%r{^(test|spec|features)/})
  end
  spec.bindir        = 'exe'
  spec.executables   = spec.files.grep(%r{^exe/}) { |f| File.basename(f) }
  spec.require_paths = ['lib']

  spec.add_development_dependency 'bundler', '~> 1.14'
  spec.add_development_dependency 'rake', '~> 10.0'
  spec.add_development_dependency 'rspec', '~> 3.0'
  spec.add_development_dependency 'vcr', '~> 3'
  spec.add_development_dependency 'webmock', '~> 2.1'
  spec.add_development_dependency 'pry', '~> 0.10'
  spec.add_development_dependency 'fuubar', '~> 2.2'
  spec.add_development_dependency 'codeclimate-test-reporter', '~> 0.6'
  spec.add_dependency 'rest-client', '~> 1.8'
  spec.add_dependency 'oj', '~> 3.3'
end
