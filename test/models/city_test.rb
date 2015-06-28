require 'test_helper'

class CityTest < ActiveSupport::TestCase
  test "should accept and decline a user" do
    city = cities(:testozavodsk)
    resident = users(:michael)
    assert_not city.citizen?(resident)
    city.accept(resident)
    assert city.citizen?(resident)
    assert resident.mothercity.id == city.id
    city.decline(resident)
    assert_not city.citizen?(resident)
  end
end
