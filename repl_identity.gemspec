require_relative "lib/repl_identity"

Gem::Specification.new do |s|
	s.name        = 'repl_identity'
	s.version     = ReplIdentity::VERSION
	s.license     = 'MIT'
	s.summary     = "A simple gem for working with Repl Identites"
	s.description = "With this gem, you can easily create and verify Repl Identity functions for use in your secure cover page console repls."
	s.author      = 'CodingCactus'
	s.email       = 'codingcactus.cc@gmail.com'
	s.files       = ["lib/repl_identity.rb", "lib/repl_identity/token.rb", "lib/repl_identity/identity.rb"]
	s.homepage    = 'https://github.com/Coding-Cactus/repl_identityrb'
	s.metadata    = { "source_code_uri" => "https://github.com/Coding-Cactus/repl_identityrb" }
    s.add_runtime_dependency 'http', '~> 4.4', '>= 4.4.1'
	s.add_runtime_dependency 'json', '~> 2.5', '>= 2.5.1'
end
