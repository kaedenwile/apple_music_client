# frozen_string_literal: true

require "apple_music_client/shared/client"
require "apple_music_client/shared/paginated_response"
require "apple_music_client/data/artist"

module AppleMusicClient
  # Client for accessing the Apple Music storefront
  class StoreClient < Client
    def find_artist(artist_name:)
      response = get_catalog("search?term=#{escape(artist_name)}&types=artists")
      parse(response.dig("results", "artists", "data"))[0]
    end

    def get_artist(artist_id:)
      response = get_catalog("artists/#{artist_id}")
      parse(response["data"])[0]
    end

    def get_albums(artist:)
      PaginatedResponse.new(self, get("/v1/catalog/us/artists/#{artist.id}/albums?limit=100"))
      # parse(response).sort_by { |album| album.releaseDate }.reverse
    end

    private

    def escape(term)
      ERB::Util.url_encode(term)
    end

    def get_catalog(resource)
      get("/v1/catalog/us/#{resource}")
    end

    def parse(payload)
      return [] if payload.nil?

      payload.map do |value|
        case value["type"]
        when "artists"
          Artist.new(value)
        when "albums"
          Album.new(value)
        else
          puts "Unknown type:", value
        end
      end
    end
  end
end
