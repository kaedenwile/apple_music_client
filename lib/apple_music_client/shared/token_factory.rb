# frozen_string_literal: true

require "jwt"

module AppleMusicClient
  # THANKS https://medium.com/@defv/connecting-to-the-apple-music-api-from-a-ruby-on-rails-application-eba9d12f5cf9
  class TokenFactory
    def self.generate(secret_key_path:, team_id:, key_id:)
      ecdsa_key = OpenSSL::PKey::EC.new File.read(secret_key_path)
      ecdsa_public = OpenSSL::PKey::EC.new ecdsa_key
      ecdsa_public.private_key = nil
      JWT.encode TokenFactory.authentication_payload(team_id), ecdsa_public, "ES256", { kid: key_id }
    end

    def self.authentication_payload(team_id)
      {
        iss: team_id,
        iat: Time.now.to_i - 100,
        exp: Time.now.to_i + 12_000
      }
    end
  end
end
