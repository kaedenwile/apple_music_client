# frozen_string_literal: true

require "test_helper"
require "json"

class AnimalResource < ::AppleMusicClient::Resource
  attr_accessor :name, :sound, :carnivorous
  attr_reader :limbs
  attr_writer :has_wings

  def limbs=(value)
    @limbs = value * 1
  end

  def wings?
    @has_wings
  end
end

class ResourceTest < Minitest::Test
  def setup
    @dog = AnimalResource.new(JSON.parse(%({
      "name": "dog",
      "sound": "bark",
      "pet": true,
      "limbs": 4,
      "hasWings": false
    })))
  end

  def test_parsing_hash
    assert_equal("dog", @dog.name)
    assert_equal("bark", @dog.sound)
    refute_respond_to(@dog, :pet)
    assert_equal(4, @dog.limbs)
    assert_equal(false, @dog.wings?)
    assert_nil(@dog.carnivorous)
  end
end
