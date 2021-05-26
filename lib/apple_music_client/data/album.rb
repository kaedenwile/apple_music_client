# frozen_string_literal: true

require_relative "./artwork"
require_relative "./resource"

module AppleMusicClient
  # Represents an Album resource returned
  # from the Apple Music Store Api
  # https://developer.apple.com/documentation/applemusicapi/album
  class Album < Resource
    attr_accessor :id, :name, :artist_name, :genre_names, :record_label, :release_date, :track_count
    attr_writer :is_single, :is_complete # no readers, use boolean methods
    attr_reader :artwork # custom setter

    def artwork=(args)
      @artwork = Artwork.new(args)
    end

    def single?
      @is_single
    end

    def complete?
      @is_complete
    end
  end
end
