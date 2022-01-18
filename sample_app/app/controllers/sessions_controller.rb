# frozen_string_literal: true

class SessionsController < ApplicationController
  def new; end

  def create
    user = User.find_by(email: params[:session][:email].downcase)
    if user&.authenticate(params[:session][:password])
      # TODO: ユーザーログイン後にユーザー情報のページにリダイレクトする
    else
      flash.now[:danger] = 'Invalid email/password combination'
      render 'new'
    end
  end
end
