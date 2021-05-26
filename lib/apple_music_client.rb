# frozen_string_literal: true

require_relative "apple_music_client/version"

# Clients for accessing the Apple Music Storefront
# and user libraries.
module AppleMusicClient
  class Error < StandardError; end

  autoload :LibraryClient, "apple_music_client/library/library_client"
  autoload :TokenFactory, "apple_music_client/shared/token_factory"
  autoload :StoreClient, "apple_music_client/store/store_client"

  autoload :Album, "apple_music_client/data/album"
  autoload :Artist, "apple_music_client/data/artist"
  autoload :Artwork, "apple_music_client/data/artwork"
  autoload :Resource, "apple_music_client/data/resource"
end
