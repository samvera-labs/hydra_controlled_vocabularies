$:.push File.expand_path("../lib", __FILE__)

# Maintain your gem's version:
require "hydra_controlled_vocabularies/version"

# Describe your gem and declare its dependencies:
Gem::Specification.new do |s|
  s.name        = "hydra_controlled_vocabularies"
  s.version     = HydraControlledVocabularies::VERSION
  s.authors     = ["Trey Terrell"]
  s.email       = ["trey.terrell@oregonstate.edu"]
  s.homepage    = "https://github.com/OregonDigital/HydraControlledVocabularies"
  s.summary     = "An engine for adding controlled vocabulary support to Hydra applications."
  s.license     = "Apache2"

  s.files = Dir["{app,config,db,lib}/**/*", "LICENSE", "Rakefile", "README.rdoc"]
  s.test_files = Dir["spec/**/*"]

  s.add_dependency "rails", "~> 4.2.1"
  s.add_dependency "hydra-editor", "~> 1.0"

  s.add_development_dependency "sqlite3"
  s.add_development_dependency "engine_cart"
  s.add_development_dependency "pry-byebug"
  s.add_development_dependency "rspec-rails"
end
