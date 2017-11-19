
lib = File.expand_path("../lib", __FILE__)
$LOAD_PATH.unshift(lib) unless $LOAD_PATH.include?(lib)
require "kp_api/version"

Gem::Specification.new do |spec|
  spec.name          = "kp_api"
  spec.version       = KpApi::VERSION
  spec.authors       = ["Alexey Vildyaev"]
  spec.email         = ["ya@hav0k.ru"]
  spec.homepage      = 'https://github.com/groverz/kp_api'

  spec.summary              = %q{Ruby wrapper for KinoPoisk API}
  spec.description          = %q{Gem is based on the mobile API. Search, details, films, people.}
  spec.license              = 'MIT'

  spec.files                = `git ls-files`.split("\n")
  spec.test_files           = `git ls-files -- {test,spec,features}/*`.split("\n")
  spec.require_paths        = ['lib']

  spec.required_ruby_version = '>= 1.9.2'

  spec.add_runtime_dependency 'hashie', '>= 2.0'

  spec.add_development_dependency "bundler", "~> 1.16"
  spec.add_development_dependency "rake", "~> 10.0"
  spec.add_development_dependency 'rspec', '~> 3.0'
  spec.add_development_dependency 'pry'
  spec.add_development_dependency 'awesome_print'

end
