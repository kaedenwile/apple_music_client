# frozen_string_literal: true

require "httparty"

module AppleMusicClient
  # Generic client containing common code
  # for talking to the Apple Music Api.
  class Client
    def initialize(token)
      @token = token
    end

    def get(resource)
      response = HTTParty.get(
        "https://api.music.apple.com#{resource}",
        { headers: headers }
      )

      if response.code == 200
        JSON.parse(response.body)
      else
        puts "NON 200 CODE for resource #{resource}"
        puts response
      end
    end

    def post(resource)
      HTTParty.post(
        "https://api.music.apple.com#{resource}",
        { headers: headers }
      )
    end

    def headers
      {
        'Authorization': "Bearer #{@token}"
      }
    end
  end
end
