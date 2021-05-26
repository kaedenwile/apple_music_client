# frozen_string_literal: true

require_relative "./resource"

module AppleMusicClient
  # Represents an Artist resource returned
  # from the Apple Music Store Api
  # https://developer.apple.com/documentation/applemusicapi/artist
  class Artist < Resource
    attr_accessor :id, :name, :genre_names
  end
end
