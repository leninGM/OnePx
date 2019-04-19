# frozen_string_literal: true

require "test_helper"

class UserTest < ActiveSupport::TestCase
  test "Valid user with valid attributes" do
    user = User.new.tap do |u|
      u.email = "test@email.com"
      u.password = "pa$$word"
      u.password_confirmation = "pa$$word"
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
    user = User.new.tap do |u|
      u.email = "user@email.com"
      u.password = "pa$$word"
      u.password_confirmation = "pa$$word"
    end

    assert_not_equal user.valid?, true

    assert_not_empty user.errors[:email]

    assert_empty user.errors[:password]
  end

  test "Invalid user with short password" do
    user = User.new.tap do |u|
      u.email = "test@mail.com"
      u.password = "pa$$"
      u.password_confirmation = "pa$$"
    end

    assert_not_equal user.valid?, true

    assert_not_empty user.errors[:password]

    assert_empty user.errors[:email]
  end
end
