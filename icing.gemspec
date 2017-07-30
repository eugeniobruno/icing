# coding: utf-8

lib = File.expand_path('../lib', __FILE__)
$LOAD_PATH.unshift(lib) unless $LOAD_PATH.include?(lib)
require 'icing/version'

Gem::Specification.new do |spec|
  spec.name     = 'icing'
  spec.version  = Icing::VERSION
  spec.date     = '2017-07-30'
  spec.authors  = ['Eugenio Bruno']
  spec.email    = ['eugeniobruno@gmail.com']

  spec.summary  = 'Icing is a framework to reify and work with composable decorations.'
  spec.homepage = 'https://github.com/eugeniobruno/icing'
  spec.license  = 'MIT'

  spec.files    = `git ls-files -z`.split("\x0").reject do |f|
    f.match(%r{^(test|spec|features)/})
  end
  spec.bindir           = 'bin'
  spec.executables      = spec.files.grep(%r{^exe/}) { |f| File.basename(f) }
  spec.test_files       = spec.files.grep(%r{^(test|spec|features)/})
  spec.require_paths    = ['lib']
  spec.extra_rdoc_files = %w[LICENSE.txt README.md CODE_OF_CONDUCT.md CHANGELOG.md]

  spec.required_ruby_version = '>= 2.0.0'

  spec.add_development_dependency 'bundler', '~> 1.15'
  spec.add_development_dependency 'rake', '~> 10.0'
  spec.add_development_dependency 'minitest', '~> 5.0'
  spec.add_development_dependency 'minitest-bender', '~> 0.0'
  spec.add_development_dependency 'simplecov', '~> 0.14'
  spec.add_development_dependency 'coveralls', '~> 0.8'
  spec.add_development_dependency 'pry-byebug', '~> 3.4'
end
