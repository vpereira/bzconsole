
lib = File.expand_path("../lib", __FILE__)
$LOAD_PATH.unshift(lib) unless $LOAD_PATH.include?(lib)
require "bzconsole/version"

Gem::Specification.new do |spec|
  spec.name          = "bzconsole"
  spec.version       = Bzconsole::VERSION
  spec.authors       = ["Victor Pereira"]
  spec.email         = ["vpereirabr@gmail.com"]

  spec.summary       = %q{bzconsole is a console app to interface with bugzilla}
  spec.description   = %q{its a revamp from bzconsole from ruby-bugzilla}
  spec.homepage      = "https://github.com/vpereira/bzconsole"
  spec.license       = "MIT"

  spec.files         = `git ls-files -z`.split("\x0").reject do |f|
    f.match(%r{^(test|spec|features)/})
  end
  spec.bindir        = "exe"
  spec.executables   = spec.files.grep(%r{^exe/}) { |f| File.basename(f) }
  spec.require_paths = ["lib"]

  spec.add_development_dependency "bundler", "~> 1.16"
  spec.add_development_dependency "rake", "~> 10.0"
  spec.add_development_dependency "minitest", "~> 5.0"
  spec.add_runtime_dependency "bugzilla"
  spec.add_runtime_dependency "gruff", "~> 0"
  spec.add_runtime_dependency "highline"

end
