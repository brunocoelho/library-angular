class UsersController < ApplicationController
  respond_to :json

  def user
    @user = current_user
    respond_with @user
  end
end
