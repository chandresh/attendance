require 'test_helper'

class UserTest < ActiveSupport::TestCase
  test "login should mark attendance if its the first time" do

    user = User.create email: "cp@cpant.in", password: "secret"

    prev_day = DateTime.now.prev_day
    user.attendances.create login: prev_day
    user.attendances.create login: 3.days.ago
    expected_count = 3
    user.login
    assert_equal user.attendances.count, expected_count, "Should create one attendance"
    user.login
    assert_equal user.attendances.count, expected_count, "Should not create attendance"

    #assert_response :success
  end

  test "logout for the day should update logout time" do

    user = User.create email: "cp@cpant.in", password: "secret"
    user.login
    assert_nil user.attendances.first.logout
    user.logout_for_day
    refute_nil user.attendances.first.logout

  end

end
