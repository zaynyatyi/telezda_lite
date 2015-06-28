require 'test_helper'

class CitizenshipTest < ActiveSupport::TestCase
  def setup
    @citizenship = Citizenship.new(city_id: 1, citizen_id: 2)
  end

  test "should be valid" do
    assert @citizenship.valid?
  end

  test "should require a follower_id" do
    @citizenship.city_id = nil
    assert_not @citizenship.valid?
  end

  test "should require a followed_id" do
    @citizenship.citizen_id = nil
    assert_not @citizenship.valid?
  end
end
