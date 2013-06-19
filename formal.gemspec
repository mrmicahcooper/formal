# -*- encoding: utf-8 -*-
require File.expand_path('../lib/formal/version', __FILE__)

Gem::Specification.new do |gem|
  gem.authors       = ["mrmicahcooper", "syntaxritual"]
  gem.email         = [""]
  gem.description   = %q{Helpful form builder used by Rocketeers}
  gem.summary       = %q{A form builder that wraps form fields the way we like it at Hashrocket}
  gem.homepage      = "http://github.com/mrmicahcooper/formal"

  gem.files         = `git ls-files`.split($\)
  gem.executables   = gem.files.grep(%r{^bin/}).map{ |f| File.basename(f) }
  gem.test_files    = gem.files.grep(%r{^(test|spec|features)/})
  gem.name          = "formal"
  gem.require_paths = ["lib"]
  gem.version       = Formal::VERSION

  gem.add_development_dependency("rspec-rails")
  gem.add_development_dependency("pry")
end
