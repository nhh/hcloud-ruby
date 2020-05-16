lib = File.expand_path("lib", __dir__)
$LOAD_PATH.unshift(lib) unless $LOAD_PATH.include?(lib)
require "hcloud/version"

Gem::Specification.new do |s|

  s.name = 'hcloud'
  s.version = Hcloud::VERSION

  s.summary     = "Summary"
  s.description = "Description"

  s.authors = ['Niklas Hanft']
  s.email = 'hello@niklashanft.com'
  s.homepage = 'https://github.com/nhh/hcloud-ruby'
  s.license = 'ISC'

  s.files = `git ls-files`.split("\n")
  s.required_ruby_version = '~> 2.5'
  s.require_path = 'lib'

  # Dependencies
  s.add_dependency 'http'

  # Development Dependencies
  s.add_development_dependency 'pry'
  s.add_development_dependency 'webmock'
  s.add_development_dependency 'rubocop'
  s.add_development_dependency 'byebug'
  s.add_development_dependency "rake", "~> 13.0"
  s.add_development_dependency "rspec", "~> 3.0"
  s.add_development_dependency "yard"

end
