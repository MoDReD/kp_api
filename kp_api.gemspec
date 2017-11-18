
lib = File.expand_path("../lib", __FILE__)
$LOAD_PATH.unshift(lib) unless $LOAD_PATH.include?(lib)
require "kp_api/version"

Gem::Specification.new do |spec|
  spec.name          = "kp_api"
  spec.version       = KpApi::VERSION
  spec.authors       = ["Alexey Vilyaev"]
  spec.email         = ["ya@hav0k.ru"]

  spec.summary              = %q{Gem for operation with Kinopoisk API}
  spec.description          = <<-EOF
    Gem is based on the mobile API.
  EOF

  spec.homepage             = 'https://github.com/alpha-ver/Kinopoisk-API-Gem'
  spec.license              = 'MIT'
  spec.post_install_message = "Thanks for installing!"

  spec.files         = `git ls-files -z`.split("\x0").reject do |f|
    f.match(%r{^(test|spec|features)/})
  end
  spec.bindir        = "exe"
  spec.executables   = spec.files.grep(%r{^exe/}) { |f| File.basename(f) }
  spec.require_paths = ["lib"]


  spec.required_ruby_version = '>= 1.9.2'
  spec.add_development_dependency "bundler", "~> 1.16"
  spec.add_development_dependency "rake", "~> 10.0"
  spec.add_development_dependency 'rspec', '~> 3.0'
  spec.add_development_dependency "minitest", "~> 5.0"
  spec.add_runtime_dependency 'hashie', '>= 2.0'

  spec.add_development_dependency 'pry'
  spec.add_development_dependency 'awesome_print'
end
