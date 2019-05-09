# frozen_string_literal: true

require "test_helper"

# The UserTest class is used to test the signup for users
class UserTest < ActiveSupport::TestCase
  test "Valid user with valid attributes" do
    user = User.new.tap do |model|
      model.email = "test@email.com"
      model.password = "pa$$word"
      model.password_confirmation = "pa$$word"
    end

    assert_equal user.valid?, true
  end

  test "Invalid user with invalid attributes" do
    user = User.new

    assert_not_equal user.valid?, true

    assert_not_empty user.errors[:email]
    assert_not_empty user.errors[:password]
  end

  test "Invalid user with duplicated email" do
    user = User.new.tap do |model|
      model.email = "user@email.com"
      model.password = "pa$$word"
      model.password_confirmation = "pa$$word"
    end

    assert_not_equal user.valid?, true

    assert_not_empty user.errors[:email]

    assert_empty user.errors[:password]
  end

  test "Invalid user with short password" do
    user = User.new.tap do |model|
      model.email = "test@mail.com"
      model.password = "pa$$"
      model.password_confirmation = "pa$$"
    end

    assert_not_equal user.valid?, true

    assert_not_empty user.errors[:password]

    assert_empty user.errors[:email]
  end
end
