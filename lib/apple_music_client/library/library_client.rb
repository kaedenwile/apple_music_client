# frozen_string_literal: true

require "apple_music_client/shared/client"
require "apple_music_client/shared/paginated_response"

module AppleMusicClient
  # Client for interacting with the library of a single user.
  class LibraryClient < Client
    def initialize(token, user_token)
      super(token)
      @user_token = user_token
    end

    def user_artists
      PaginatedResponse.new(self, get("/v1/me/library/artists"))
    end

    def user_albums
      PaginatedResponse.new(self, get("/v1/me/library/albums"))
    end

    def add_to_library(album:)
      post("/v1/me/library?ids[albums]=#{album}")
    end

    def headers
      super.merge({ 'Music-User-Token': @user_token })
    end
  end
end
