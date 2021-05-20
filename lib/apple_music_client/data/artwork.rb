require_relative "./resource"

module AppleMusicClient
  # Represents an Artwork resource returned
  # from the Apple Music Store Api
  # https://developer.apple.com/documentation/applemusicapi/artwork
  class Artwork < Resource
    attr_accessor :width, :height, :url
  end
end
