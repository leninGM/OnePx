require 'test_helper'

class RegistrationsControllerTest < ActionController::TestCase
  test 'GET /new' do
    get :new

    assert_response :success
  end
end