# frozen_string_literal: true

User.seed do |user|
  user.id = 1
  user.email = 'piyo@toku345.com'
  user.name = 'piyo Tokumitsu'
  user.password = 'piyopiyo'
  user.password_confirmation = 'piyopiyo'
end
