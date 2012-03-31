# -*- encoding: utf-8 -*-
require File.expand_path('../lib/wookie', __FILE__)

Gem::Specification.new do |gem|
  gem.authors       = ["Dominik Menke\n"]
  gem.email         = ["wookie-translator@dmke.org"]
  gem.description   = %q{Translates an english string to wookie speak and vice versa.}
  gem.summary       = %q{Translates an english string to wookie speak and vice versa.}
  gem.homepage      = "https://github.com/dmke/wookie-translator"

  gem.files         = `git ls-files`.split($\)
  gem.executables   = gem.files.grep(%r{^bin/}).map{ |f| File.basename(f) }
  gem.test_files    = gem.files.grep(%r{^(test|spec|features)/})
  gem.name          = "wookie-translator"
  gem.require_paths = ["lib"]
  gem.version       = Wookie::VERSION

  gem.add_development_dependency "rspec", "~> 2.0"
end
