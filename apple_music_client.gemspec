# frozen_string_literal: true

require_relative "lib/apple_music_client/version"

Gem::Specification.new do |spec|
  spec.name          = "apple_music_client"
  spec.version       = AppleMusicClient::VERSION
  spec.authors       = ["kaedenwile"]

  spec.summary       = "Client for access to Apple Music APIs"
  spec.license       = "MIT"
  spec.required_ruby_version = Gem::Requirement.new(">= 2.7.0")

  spec.files = Dir.chdir(File.expand_path(__dir__)) do
    `git ls-files -z`.split("\x0").reject { |f| f.match(%r{\A(?:test|spec|features)/}) }
  end
  spec.bindir        = "exe"
  spec.executables   = spec.files.grep(%r{\Aexe/}) { |f| File.basename(f) }
  spec.require_paths = ["lib"]
end
