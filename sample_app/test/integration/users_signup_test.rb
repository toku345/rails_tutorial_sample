# frozen_string_literal: true

require 'test_helper'

class UsersSignupTest < ActionDispatch::IntegrationTest
  test 'invalid signup infomation' do
    get signup_path
    assert_no_difference 'User.count' do
      post users_path, params: {
        user: {
          name: '',
          email: 'user@invalid',
          password: 'foo',
          password_confirmation: 'bar'
        }
      }
    end
    assert_template 'users/new'
    assert_select 'div#error_explanation' do
      assert_select 'div.alert.alert-danger', 'The form contains 4 counts.'
      assert_select 'ul' do
        assert_select 'li' do |elements|
          assert_equal("Name can't be blank", elements[0].text)
          assert_equal('Email is invalid', elements[1].text)
          assert_equal("Password confirmation doesn't match Password", elements[2].text)
          assert_equal('Password is too short (minimum is 6 characters)', elements[3].text)
        end
      end
    end
  end

  test 'vallid signup information' do
    get signup_path
    assert_difference 'User.count', 1 do
      post users_path, params: {
        user: {
          name: 'Example User',
          email: 'user@example.com',
          password: 'password',
          password_confirmation: 'password'
        }
      }
    end
    follow_redirect!
    assert_template 'users/show'
  end
end
