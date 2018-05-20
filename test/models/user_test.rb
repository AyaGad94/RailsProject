require 'test_helper'

class UserTest < ActiveSupport::TestCase
  test "user has email" do
    testUser = User.new(email: "ayagad@gmail.com")
    assert testUser.email == "ayagad@gmail.com"
  end
  # test "the truth" do
  #   assert true
  # end
end
