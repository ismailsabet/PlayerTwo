require 'test_helper'

class UserTest < ActiveSupport::TestCase

  test "invalid user" do
    user = User.new
    user.firstname = nil
    user.lastname = nil
    user.email = nil
    user.username = nil
    user.location = nil
    user.password = nil
    user.dob = nil
    assert user.invalid?
  end

  test "valid user" do
    user = User.new
    user.firstname = 'Gilbert'
    user.lastname = 'Humphrey'
    user.email = 'gilbert@gmail.com'
    user.username = 'gilbert'
    user.password = 'password'
    user.bio = 'Meeting new people!'
    user.dob = '1999-05-28'
    user.encrypted_password = "Test123"
    user.gender = 'Male'
    user.sign_in_count = 1
    assert user.valid?
  end
end

